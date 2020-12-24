# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can edit existing projects' do
  before do
    FactoryBot.create(:project, name: 'Sublime Text 3')

    visit '/'
    click_link 'Sublime Text 3'
    click_link 'Edit Project'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Atom - A hackable text editor for the 21st Century'
    click_button 'Update Project'

    expect(page).to have_content 'Project updated successfully.'
    expect(page).to have_content 'Atom - A hackable text editor for the 21st Century'
  end

  scenario 'when providing invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Project'

    expect(page).to have_content('Project has not been updated.')
  end
end
