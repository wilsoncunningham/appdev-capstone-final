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
  belongs_to :book_origin, required: true, class_name: "Book", foreign_key: "book_id"
  has_many  :verses, class_name: "Verse", foreign_key: "chapter_id", dependent: :destroy
  has_many  :user_chapters, class_name: "UserChapter", foreign_key: "chapter_id", dependent: :nullify
end
