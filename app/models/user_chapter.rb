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
end
