class CreateReadingPlanContents < ActiveRecord::Migration[7.1]
  def change
    create_table :reading_plan_contents do |t|
      t.integer :plan_id
      t.integer :book_id
      t.integer :sequence

      t.timestamps
    end
  end
end
