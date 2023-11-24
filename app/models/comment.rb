# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post

  after_create :increment_post_comments_counter

  alias_attribute :author, :user

  def increment_post_comments_counter
    post.increment!(:comments_counter)
  end
end
