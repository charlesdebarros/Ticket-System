# frozen_string_literal: true

module Admin
  # A Users controller for the Admin namespacing
  class UsersController < Admin::ApplicationController
    def index
      @users = User.order(:email)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        flash[:notice] = 'User successfully created.'
        redirect_to admin_users_path
      else
        flash[:alert] = 'Unable to create the user.'
        render 'new'
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :admin)
    end
  end
end
