class AddUserToBundles < ActiveRecord::Migration[5.2]
  def change
    add_column :bundles, :user_id, :integer
    add_column :users, :admin, :boolean
  end
end
