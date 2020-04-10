	class Post < ApplicationRecord
	validate :a_method_used_for_validation_purposes
  def a_method_used_for_validation_purposes
    special = "?<>',?[]}{=-)(*&^%$#`~{}"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    if title =~ regex 
      errors.add(:title, "not special character allowed")
    end 
  end
  include Commentable
	belongs_to :category
	belongs_to :user
	has_many :likes, dependent: :destroy
	#validates :title, format: { with:  /\A[a-zA-Z0-9 ]+\z/ }
	validates :blog, presence: true
	validates :user_id, presence: true
	has_many :comments, dependent: :destroy
	has_attached_file :image, styles: { large: "600*600>", medium: "300*300>", thumb: "150*150"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
	#@post = Post.create(title: "!@#%*()_-+=")
   #Post.errors.full_messages("Name cannot contain the characters !@%*()_-+=#")
   def user_likes(post)
   	post.likes.pluck(:user_id).map do |user_id| 
   		User.find(user_id).name
   	end
   end