# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Admins can manage a user's roles" do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:user)  { FactoryBot.create(:user) }

  let!(:ie)  { FactoryBot.create(:project, name: 'Internet Explorer') }
  let!(:st3) { FactoryBot.create(:project, name: 'Sublime Text 3') }

  before do
    login_as(admin)
  end

  scenario 'when assigning roles to a new user' do
    visit new_admin_user_path

    fill_in 'Email', with: 'newuser@email.com'
    fill_in 'Password', with: 'Password123'

    select 'Editor', from: 'Internet Explorer'
    click_button 'Create User'

    click_link 'newuser@email.com'
    expect(page).to have_content('Internet Explorer: Editor')
    expect(page).not_to have_content('Sublime Text 3')
  end

  scenario 'when assigning roles to an existing user' do
    visit admin_user_path(user)
    click_link 'Edit User'

    select 'Viewer',  from: 'Internet Explorer'
    select 'Manager', from: 'Sublime Text 3'

    click_button 'Update User'
    expect(page).to have_content('User successfully updated.')

    click_link user.email
    expect(page).to have_content('Internet Explorer: Viewer')
    expect(page).to have_content('Sublime Text 3: Manager')
  end
end
