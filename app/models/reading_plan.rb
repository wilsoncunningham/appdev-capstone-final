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
end
