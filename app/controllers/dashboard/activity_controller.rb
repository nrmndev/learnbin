module Dashboard
  class ActivityController < Dashboard::BaseController
    before_action :set_active_link
    def index; end
    private
    def set_active_link
      @active_link = 'topics'
    end
  end
end
