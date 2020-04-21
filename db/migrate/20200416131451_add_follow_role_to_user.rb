class AddFollowRoleToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :follow_role, :string
  end
end
