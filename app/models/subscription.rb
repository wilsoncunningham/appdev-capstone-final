# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plan_id    :integer
#  user_id    :integer
#
class Subscription < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :plan, required: true, class_name: "ReadingPlan", foreign_key: "plan_id"
end
