class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
