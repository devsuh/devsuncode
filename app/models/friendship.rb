class Friendship < ApplicationRecord
	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"
			
	# validates :follower_id, presence: true
	# validates :followed_id, presence: true
	#binding.pry
	def current_status(user)
    Friendship.where(followed_id: current_user.id, follower_id: user.id).pluck("status")
  end
end
