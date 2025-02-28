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
end
