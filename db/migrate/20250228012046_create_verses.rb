class CreateVerses < ActiveRecord::Migration[7.1]
  def change
    create_table :verses do |t|
      t.integer :chapter_id
      t.integer :number
      t.text :content

      t.timestamps
    end
  end
end
