module DashboardSectionTracking
  extend ActiveSupport::Concern

  included do
    before_action :set_dashboard_section
  end

  private

  def set_dashboard_section
    dashboard_pages = %w[archives activity collections dashboard posts settings topics usage]
    @is_dashboard_page = dashboard_pages.include?(controller_name)
    @section = controller_name # or a custom mapping
  end
end
