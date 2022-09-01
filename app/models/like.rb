class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_likes_counter
    post.increment!(:likes_counter)
  end

  after_save :update_like_counter

  private

  def update_like_counter
    author.increment!(:likes_counter)
  end
end
