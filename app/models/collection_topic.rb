class CollectionTopic < ApplicationRecord
  include Visibility
  belongs_to :collection
  belongs_to :topic
  acts_as_list scope: :collection
  # optional: ordering
end
