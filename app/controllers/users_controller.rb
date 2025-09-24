
  class UsersController < ApplicationController
    before_action :set_user, only: %i[index]

    def index
      unless @user
        redirect_to root_path, alert: "User not found"
        return
      end
    end

    def show; end

    private

    def set_user
      if params[:username]
        @user = User.find_by(name: params[:name])
      end
    end
  end
