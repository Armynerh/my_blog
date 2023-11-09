class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  before_create :increment_user_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def increment_user_posts_counter
    author.increment!(:posts_counter) if author.present?
  end
end
