module Dashboard
  class ArchivesController < Dashboard::BaseController
    before_action :set_active_link

    private
    def set_active_link
      @active_link = 'topics'
    end
  end
end
