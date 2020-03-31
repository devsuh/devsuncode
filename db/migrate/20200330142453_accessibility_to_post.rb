class AccessibilityToPost < ActiveRecord::Migration[6.0]
  def change
  	add_column :posts, :accessibility, :string
  end
end
