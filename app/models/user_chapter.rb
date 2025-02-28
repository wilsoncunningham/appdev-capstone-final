# == Schema Information
#
# Table name: user_chapters
#
#  id              :bigint           not null, primary key
#  completed_at    :time
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  chapter_id      :integer
#  reading_plan_id :integer
#  user_id         :integer
#
class UserChapter < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :chapter, required: true, class_name: "Chapter", foreign_key: "chapter_id"
  belongs_to :reading_plan, class_name: "ReadingPlan", foreign_key: "reading_plan_id"
end
