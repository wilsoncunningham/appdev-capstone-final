# == Schema Information
#
# Table name: reading_plan_contents
#
#  id         :bigint           not null, primary key
#  sequence   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  plan_id    :integer
#
class ReadingPlanContent < ApplicationRecord
  belongs_to :book, required: true, class_name: "Book", foreign_key: "book_id"
  belongs_to :track, required: true, class_name: "ReadingPlan", foreign_key: "plan_id"
end
