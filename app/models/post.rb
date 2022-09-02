class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  # app/models/post.rb

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
