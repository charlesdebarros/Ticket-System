# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectPolicy, type: :policy do
  let(:user) { User.new }

  subject { ProjectPolicy }

  context 'policy scope' do
    subject { Pundit.policy_scope(user, Project) }

    let!(:project) { FactoryBot.create(:project) }
    let!(:user)    { FactoryBot.create(:user) }

    it 'is empty for anonymous users' do
      expect(Pundit.policy_scope(nil, Project)).to be_empty
    end

    it 'includes projects a user is allowed to view' do
      assign_role!(user, :viewer, project)
      expect(subject).to include(project)
    end

    it 'does not include projects a user is not allowed to view' do
      expect(subject).to be_empty
    end

    it 'returns all projects for admins' do
      user.admin = true
      expect(subject).to include(project)
    end
  end

  context 'permissions' do
    subject { ProjectPolicy.new(user, project) }

    let(:user)    { FactoryBot.create(:user) }
    let(:project) { FactoryBot.create(:project) }

    context 'for anonymous users' do
      let(:user) { nil }

      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end

    context 'for viewers of the project' do
      before { assign_role!(user, :viewer, project) }

      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context 'for editors of the project' do
      before { assign_role!(user, :editor, project) }

      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context 'for managers of the project' do
      before { assign_role!(user, :manager, project) }

      it { should permit_action :show }
      it { should permit_action :update }
    end

    context 'for managers of other projects' do
      before do
        assign_role!(user, :manager, FactoryBot.create(:project))
      end

      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end

    context 'for administrators' do
      let(:user) { FactoryBot.create(:user, :admin) }

      it { should permit_action :show }
      it { should permit_action :update }
    end
  end

  # permissions :show? do
  #   let(:user) { FactoryBot.create(:user) }
  #   let(:project) { FactoryBot.create(:project) }

  #   it 'blocks anonymous users' do
  #     expect(subject).not_to permit(nil, project)
  #   end

  #   it 'allows viewers of the project' do
  #     assign_role!(user, :editor, project)
  #     expect(subject).to permit(user, project)
  #   end

  #   it 'allows editors of the project' do
  #     assign_role!(user, :editor, project)
  #     expect(subject).to permit(user, project)
  #   end

  #   it 'allows managers of the project' do
  #     assign_role!(user, :manager, project)
  #     expect(subject).to permit(user, project)
  #   end

  #   it 'allows administrators' do
  #     admin = FactoryBot.create(:user, :admin)
  #     expect(subject).to permit(admin, project)
  #   end

  #   it 'does not allow users assigned to other projects' do
  #     other_project = FactoryBot.create(:project)
  #     assign_role!(user, :manager, other_project)
  #     expect(subject).not_to permit(user, project)
  #   end
  # end

  # # permissions :create? do
  # #   pending "add some examples to (or delete) #{__FILE__}"
  # # end

  # permissions :update? do
  #   let(:user)    { FactoryBot.create(:user) }
  #   let(:project) { FactoryBot.create(:project) }

  #   it 'blocks anonymous users' do
  #     expect(subject).not_to permit(nil, project)
  #   end

  #   it 'does not allow viewers of the project' do
  #     assign_role!(user, :viewer, project)
  #     expect(subject).not_to permit(user, project)
  #   end

  #   it 'does not allow editors of the project' do
  #     assign_role!(user, :editor, project)
  #     expect(subject).not_to permit(user, project)
  #   end

  #   it 'allows managers of the project' do
  #     assign_role!(user, :manager, project)
  #     expect(subject).to permit(user, project)
  #   end

  #   it 'allows admistrators' do
  #     admin = FactoryBot.create(:user, :admin)
  #     expect(subject).to permit(admin, project)
  #   end

  #   it 'does not allow users assgined to other projects' do
  #     other_project = FactoryBot.create(:project)
  #     assign_role!(user, :manager, other_project)
  #     expect(subject).not_to permit(user, project)
  #   end
  # end

  # permissions :destroy? do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end
end
