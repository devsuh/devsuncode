	
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
	
	#validates :title, format: { with:  /\A[a-zA-Z0-9 ]+\z/ }
	validates :blog, presence: true
	validates :user_id, presence: true
	has_many :comments, dependent: :destroy
	has_attached_file :image, styles: { large: "600*600>", medium: "300*300>", thumb: "150*150"}
	 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
	#@post = Post.create(title: "!@#%*()_-+=")
   #Post.errors.full_messages("Name cannot contain the characters !@%*()_-+=#")