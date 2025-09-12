class Topic < ApplicationRecord
  belongs_to :category
  has_many :articles, dependent: :destroy
end
