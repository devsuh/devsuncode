class User < ApplicationRecord 
  
	#require_relative "commentable.rb"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_one :ROLES
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_friendships, class_name:"friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friendships, class_name:"friendship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower
  debugger
  def follow(user)
    active_friendships.create(followed_id: user.id)
  end
  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end
  def following?(user)
    following.include?(user)
  end  

  enum roles_mask: %i[admin author blogreader]
  ROLES = %i[author blogreader] 
end

