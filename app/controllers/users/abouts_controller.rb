module Users
  class AboutsController < ApplicationController
    before_action :set_active_link, only: %i[index]
    before_action :set_user, only: %i[index]
    def index; end

    private
    def set_active_link
      @active_link = 'abouts'
    end

    def set_user
      @user = User.where(username: params[:username]).first
    end
  end
end
