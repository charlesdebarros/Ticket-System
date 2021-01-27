# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Admin can change a user's details: " do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:user)       { FactoryBot.create(:user) }

  before do
    login_as(admin_user)
    visit admin_user_path(user)
    click_link 'Edit User'
  end

  scenario 'with valid details' do
    fill_in 'Email', with: 'newguy@email.com'
    click_button 'Update User'

    expect(page).to have_content('User successfully updated.')
    expect(page).to have_content('newguy@email.com')
    expect(page).not_to have_content(user.email)
  end

  scenario 'with invalid details' do
    fill_in 'Email', with: ''
    click_button 'Update User'

    expect(page).to have_content('Unable to update user.')
    expect(page.current_url).to eq(admin_user_url(user))
  end

  scenario "when toggling a user's admin ability" do
    check 'Is an admin?'
    click_button 'Update User'

    expect(page).to have_content('User successfully updated.')
    expect(page).to have_content("#{user.email} (Admin)")
  end
end