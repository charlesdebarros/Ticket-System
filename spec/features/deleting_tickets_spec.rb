# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can delete tickets' do
  let(:author)  { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project) }
  let(:ticket)  do
    FactoryBot.create(:ticket, project: project, author: author)
  end

  before do
    login_as(author)
    assign_role!(author, :viewer, project)
    visit project_ticket_path(project, ticket)
  end

  scenario 'successfully' do
    click_link 'Delete Ticket'

    expect(page).to have_content('Ticket successfully deleted.')
    expect(page.current_url).to eq(project_url(project))
  end
end
