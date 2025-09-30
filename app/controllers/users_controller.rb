
  class UsersController < Users::BaseController
    before_action :set_user, only: %i[show]
    before_action :set_active_link, only: %i[show]

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
        @user = User.where(username: params[:username]).first
      end
    end

    def set_active_link
      @active_link = 'users'
    end


  end
