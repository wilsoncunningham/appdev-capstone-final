class CreateUserBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :user_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.time :completed_at
      t.text :status

      t.timestamps
    end
  end
end
