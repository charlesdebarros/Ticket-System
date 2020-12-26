# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it 'handles a missing project correctly' do
    get :show, params: { id: 'not-here' }

    expect(response).to redirect_to(projects_path)

    message = 'The project you are looking for cannot be found!'
    expect(flash[:alert]).to eq(message)
  end
end
