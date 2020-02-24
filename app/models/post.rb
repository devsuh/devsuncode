class Post < ApplicationRecord
	belongs_to :user
	validates :blog, presence: true
	validates :user_id, presence: true
	has_many :comments, dependent: :destroy
	has_attached_file :image, styles: { large: "600*600>", medium: "300*300>", thumb: "150*150"}
	 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
