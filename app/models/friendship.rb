# == Schema Information
#
# Table name: friendships
#
#  id         :bigint           not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user1_id   :integer
#  user2_id   :integer
#
class Friendship < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user1_id", counter_cache: :friends_count
end
