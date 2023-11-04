class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_create :update_user_posts_counter

  def update_user_posts_counter
    user.increment!(:posts_counter)
  end
end
