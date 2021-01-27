# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Admins can create new users: ' do
  let(:admin) { FactoryBot.create(:user, :admin) }

  before do
    login_as(admin)
    visit '/'
    click_link 'Admin'
    click_link 'Users'
    click_link 'New User'
  end

  scenario 'with valid credentials' do
    fill_in 'Email', with: 'new_user@email.com'
    fill_in 'Password', with: 'Password123'
    click_button 'Create User'
    expect(page).to have_content('User successfully created.')
  end

  scenario 'with invalid credentials' do
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Create User'
    expect(page).to have_content('Unable to create the user')
  end

  scenario 'when a new user is an admin' do
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'Password123'
    check 'Is an admin?'
    click_button 'Create User'
    expect(page).to have_content('User successfully created.')
    expect(page).to have_content('admin@example.com (Admin)')
  end
end
