class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_create :increment_user_posts_counter
  before_validation :initialize_counters, on: :create

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def increment_user_posts_counter
    author.increment!(:posts_counter) if author.present?
  end

  private

  def initialize_counters
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
