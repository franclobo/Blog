class User < ApplicationRecord
  validates :name, presence: true
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'

  # app/models/user.rb

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
