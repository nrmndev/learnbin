class PostPart < ApplicationRecord
  belongs_to :post
  belongs_to :part
  acts_as_list scope: :post
  # optional: ordering
end
