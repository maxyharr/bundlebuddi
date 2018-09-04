class CreateBundleSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :bundle_subscriptions do |t|
      t.integer :bundle_id
      t.integer :subscription_id
      t.timestamps
    end
  end
end
