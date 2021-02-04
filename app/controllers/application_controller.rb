class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_authorised

  private

  def not_authorised
    redirect_to root_path, alert: 'You are not allowed to do that.'
  end
end
