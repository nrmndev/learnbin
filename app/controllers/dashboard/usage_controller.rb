module Dashboard
  class UsageController < Dashboard::BaseController
    before_action :set_active_link
    def index; end

    def set_active_link
      @active_link = 'topics'
    end
  end
end
