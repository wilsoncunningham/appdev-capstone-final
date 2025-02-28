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
end
