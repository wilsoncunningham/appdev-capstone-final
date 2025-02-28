class CreateChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.integer :book_id
      t.integer :number
      t.text :content

      t.timestamps
    end
  end
end
