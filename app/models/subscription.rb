class Subscription < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :plan, required: true, class_name: "ReadingPlan", foreign_key: "plan_id"
end
