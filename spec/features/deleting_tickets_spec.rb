# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can delete tickets' do
  let(:project) { FactoryBot.create(:project) }
  let(:ticket)  { FactoryBot.create(:ticket, project: project) }

  before do
    visit project_ticket_path(project, ticket)
  end

  scenario 'successfully' do
    click_link 'Delete Ticket'

    expect(page).to have_content('Ticket successfully deleted.')
    expect(page.current_url).to eq(project_url(project))
  end
end
