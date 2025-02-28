# == Schema Information
#
# Table name: verses
#
#  id         :bigint           not null, primary key
#  content    :text
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chapter_id :integer
#
class Verse < ApplicationRecord
  belongs_to :chapter, required: true, class_name: "Chapter", foreign_key: "chapter_id"
end
