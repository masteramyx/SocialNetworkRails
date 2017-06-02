class User < ApplicationRecord
  # people that user is following are found via subscriptions
  has_many :subscriptions, foreign_key: :follower_id,
                          dependent: :destroy
  has_many :leaders, through: :subscriptions

  #people that are following user are found via reverse_subscriptions
  has_many :reverse_subscriptions, foreign_key: :leader_id,
                                    class_name: :'Subscription',
                                    dependent: :destroy

  has_many :followers, through: :reverse_subscriptions

  #whenever a new model is created...ADD THE ASSOCIATIONS LIKE BELOW
  #a user will have many posts, which include TextPost & ImagePost
  has_many :posts, dependent: :destroy
  has_many :text_posts, dependent: :destroy
  has_many :image_posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password
  validates :email, presence: true, uniqueness: true

  #check if user is following (leader)
  def following?(leader)
    leaders.include? leader
  end

#Method makes user follow (leader) if (leader) is not User.
# << --> "insertion operator"
  def follow!(leader)
    if leader != self && !following?(leader)
      leaders << leader
    end
  end
end
