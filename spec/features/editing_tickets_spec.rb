# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can edit existing tickets' do
  let(:project) { FactoryBot.create(:project) }
  let(:ticket) { FactoryBot.create(:ticket, project: project) }

  before do
    visit project_ticket_path(project, ticket)
    click_link 'Edit Ticket'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Make it really shiny!'
    click_button 'Update Ticket'

    expect(page).to have_content('Ticket successfully updated.')

    within('#ticket h2') do
      expect(page).to have_content('Make it really shiny!')
      expect(page).not_to have_content(ticket.name)
    end
  end

  scenario 'with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Ticket'

    expect(page).to have_content('Unable to update ticket.')
  end
end