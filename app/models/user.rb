class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_one :ROLES
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  enum roles_mask: %i[admin author blogreader]
  ROLES = %i[author blogreader] 
end

