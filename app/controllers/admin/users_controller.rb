# frozen_string_literal: true

module Admin
  # A Users controller for the Admin namespacing
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: %w[show edit update destroy]

    def index
      @users = User.order(:email)
    end

    def show; end

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

    def edit; end

    def update
      # Acts on failing validation when password field is empty
      params[:user][:password].blank? && params[:user].delete(:password)

      if @user.update(user_params)
        flash[:notice] = 'User successfully updated.'
        redirect_to admin_users_path
      else
        flash[:alert] = 'Unable to update user.'
        render 'edit'
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :admin)
    end
  end
end
