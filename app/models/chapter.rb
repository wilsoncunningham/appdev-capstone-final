# == Schema Information
#
# Table name: chapters
#
#  id         :bigint           not null, primary key
#  content    :text
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#
class Chapter < ApplicationRecord
end
