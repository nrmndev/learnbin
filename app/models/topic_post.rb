class TopicPost < ApplicationRecord
  include Visibility
  belongs_to :topic
  belongs_to :post
  acts_as_list scope: :topic
  # optional: ordering
end
