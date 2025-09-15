module Visibility
  extend ActiveSupport::Concern

  included do
    enum visibility: {
      visible: 0,
      private: 1,
      hidden: 2
    }, _suffix: true

    # common scopes
    scope :publicly_visible, -> { where(visibility: visibilities[:visible]) }
    scope :not_hidden, -> { where.not(visibility: visibilities[:hidden]) }
  end

  # Instance methods
  def visible_to?(user)
    if visibility_visible?
      true
    elsif visibility_private?
      user.present? && self.user == user
    elsif visibility_hidden?
      false
    else
      false
    end
  end
end
