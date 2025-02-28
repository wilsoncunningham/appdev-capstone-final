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
end
