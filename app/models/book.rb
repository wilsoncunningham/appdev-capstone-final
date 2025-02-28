# == Schema Information
#
# Table name: books
#
#  id                    :bigint           not null, primary key
#  bible_position        :integer
#  current_readers_count :integer
#  description           :text
#  testament             :string
#  title                 :string
#  total_chapters        :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Book < ApplicationRecord
  has_many  :current_readers, class_name: "User", foreign_key: "current_book_id", dependent: :nullify
  has_many  :chapters, class_name: "Chapter", foreign_key: "book_id", dependent: :destroy
  has_many  :user_progresses, class_name: "UserBook", foreign_key: "book_id", dependent: :destroy
  has_many  :reading_tracks, class_name: "ReadingPlanContent", foreign_key: "book_id", dependent: :nullify
  has_many :readers, through: :user_progresses, source: :user
end
