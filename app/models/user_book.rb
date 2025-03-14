# == Schema Information
#
# Table name: user_books
#
#  id           :bigint           not null, primary key
#  completed_at :time
#  status       :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  book_id      :integer
#  user_id      :integer
#
class UserBook < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :book, required: true, class_name: "Book", foreign_key: "book_id"
end
