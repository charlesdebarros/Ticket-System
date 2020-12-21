# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can create new projects' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'Add a project'

    fill_in 'Name', with: 'Sublime Text 3'
    fill_in 'Description', with: 'A text editor for everyone'
    click_button 'Create Project'

    expect(page).to have_content 'Project successfully created.'
  end
end
