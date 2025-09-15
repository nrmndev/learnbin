class Topic < ApplicationRecord
  include Visibility
  belongs_to :category
  belongs_to :user
  has_many :articles, dependent: :destroy
 #enum visibility: { visible: 0, private: 1, hidden: 2 }, _suffix: true
end
