class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :testament
      t.text :description
      t.integer :total_chapters
      t.integer :bible_position
      t.integer :current_readers_count

      t.timestamps
    end
  end
end
