class User < ApplicationRecord 
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_one :ROLES
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  
  has_many :passive_friendships, class_name:"Friendship", foreign_key: "followed_id", dependent: :destroy
  has_many :active_friendships, class_name:"Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower
  def follow(user)
     if user.follow_role == "Follow-Directly"
      active_friendships.create(followed_id: user.id)
     else
       active_friendships.create(followed_id: user.id, status: 'pending')
    end
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end 

  def current_status(user)
    #binding.pry
    Friendship.find_by(followed_id: user.id, follower_id: id).try(:status)
  end

  
  enum roles_mask: %i[admin author blogreader]
  ROLES = %i[author blogreader] 

  
  # enum follow_role: %i[Follow-Directly Follow-on-Approval]
  ROLESS = %i[Follow-Directly Follow-on-Approval] 
end

