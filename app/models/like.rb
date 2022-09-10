class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_create -> { update_post_likes_counter(:increment) }
  after_destroy -> { update_post_likes_counter(:decrement) }

  def update_post_likes_counter(operation)
    if operation == :increment
      post.increment!(:likes_counter)
    else
      post.decrement!(:likes_counter)
    end
  end
end
