module UsersPageSectionTracking
  extend ActiveSupport::Concern

  included do
    before_action :set_userspage_section
  end

  private

  def set_userspage_section
    users_pages = %w[about topics posts bookmarks abouts]
    @is_user_page = users_pages.include?(controller_name)
    @section = controller_name # or a custom mapping
  end
end
