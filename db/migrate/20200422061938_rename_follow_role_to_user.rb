class RenameFollowRoleToUser < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :follow_role, :string, default: 'Follow-Directly'
  end
end
