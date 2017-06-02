class Post < ApplicationRecord

  #adding [dependent: :destroy] to a belongs_to association means that
  # destroying any Post would delete the associated User!!!!!!
  #COMMON MISTAKE!!!! DONT DO IT!!!
  belongs_to :user
  has_many :comments, dependent: :destroy
  #validates that Post cant be created without valid 'user_id'
  validates :user_id, presence: true
  #validates that it is TextPost or ImagePost
  validates :type, presence: true
end
