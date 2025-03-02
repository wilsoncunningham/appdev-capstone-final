# == Schema Information
#
# Table name: reading_plans
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ReadingPlan < ApplicationRecord
  has_many  :books, class_name: "ReadingPlanContent", foreign_key: "plan_id", dependent: :nullify
  has_many  :user_chapters, class_name: "UserChapter", foreign_key: "reading_plan_id", dependent: :nullify
  has_many  :subscriptions, class_name: "Subscription", foreign_key: "plan_id", dependent: :destroy
end
