class StatusToFriendship < ActiveRecord::Migration[6.0]
  def change
  	add_column :friendships, :status, :string, default: 'follow'
  end
end
