# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  friends_count          :integer
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  current_book_id        :integer
#  current_track_id       :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many  :friends, class_name: "Friendship", foreign_key: "user1_id", dependent: :nullify
  has_many  :user_chapters, class_name: "UserChapter", foreign_key: "user_id", dependent: :destroy
  has_many  :subscriptions, class_name: "Subscription", foreign_key: "user_id", dependent: :destroy
  belongs_to :current_book, required: false, class_name: "Book", foreign_key: "current_book_id", counter_cache: :current_readers_count
  has_many :readings, through: :user_progresses, source: :book
end
