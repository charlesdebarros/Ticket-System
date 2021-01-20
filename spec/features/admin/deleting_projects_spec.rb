# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can delete projects' do
  before do
    login_as(FactoryBot.create(:user, :admin))
  end

  before do
    FactoryBot.create(:project, name: 'Sublime Text 3')

    visit '/'
    click_link 'Sublime Text 3'
    click_link 'Delete Project'
  end

  scenario 'successfully' do
    expect(page).to have_content('Project successfully deleted!')
    expect(page.current_url).to eq(projects_url)
    expect(page).to_not have_content('Sublime Text 3')
  end
end
