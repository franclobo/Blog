class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :posts, dependent: :destroy, foreign_key: 'user_id'

  # app/models/user.rb
  #after_initialize :update
  def recent_post
    posts.order('created_at Desc').limit(3)
  end

  def update
    self.photo = 'https://cdn-icons-png.flaticon.com/512/599/599305.png'
  end
end
