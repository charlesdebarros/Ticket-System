# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User can create new tickets' do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
    project = FactoryBot.create(:project, name: 'Internet Explorer')
    assign_role!(user, :editor, project)

    visit project_path(project)
    click_link 'New Ticket'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Non-standard compliance'
    fill_in 'Description', with: 'Pages are ugly!'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket successfully created')
    within('#ticket') do
      expect(page).to have_content("Author: #{user.email}")
    end
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Ticket'

    expect(page).to have_content 'Unable to create your ticket'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario 'with an invalid description' do
    fill_in 'Name', with: 'Non-standard compliance'
    fill_in 'Description', with: 'Sucks!'
    click_button 'Create Ticket'

    expect(page).to have_content 'Unable to create your ticket'
    expect(page).to have_content 'Description is too short'
  end

  scenario 'with an attachment' do
    fill_in 'Name', with: 'Add documentation for blink tag'
    fill_in 'Description', with: 'The blink tag has a speed attribute'
    attach_file 'File', 'spec/fixtures/speed.txt'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket successfully created')

    within('#ticket .attachment') do
      expect(page).to have_content('speed.txt')
    end
  end

  scenario 'persisting file uploads across form displays' do
    attach_file 'File', 'spec/fixtures/speed.txt'
    click_button 'Create Ticket'

    fill_in 'Name', with: 'Add documentation for blink tag'
    fill_in 'Description', with: 'The blink tag has a speed attribute'
    click_button 'Create Ticket'

    within('#ticket .attachment') do
      expect(page).to have_content 'speed.txt'
    end
  end
end
