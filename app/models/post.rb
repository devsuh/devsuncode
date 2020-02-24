class Post < ApplicationRecord
	belongs_to :user
	validates :blog, presence: true
	validates :user_id, presence: true
	has_many :comments, dependent: :destroy
end
