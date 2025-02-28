class CreateUserChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :user_chapters do |t|
      t.integer :chapter_id
      t.integer :user_id
      t.time :completed_at
      t.string :status
      t.integer :reading_plan_id

      t.timestamps
    end
  end
end
