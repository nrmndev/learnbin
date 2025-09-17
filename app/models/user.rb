class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :collections, foreign_key: :author_id, dependent: :nullify
  has_many :topics, foreign_key: :user_id, dependent: :nullify
  has_many :posts, foreign_key: :user_id, dependent: :nullify
  has_many :parts, foreign_key: :user_id, dependent: :nullify
end
