# spec/features/post_show_spec.rb

require 'rails_helper'

RSpec.feature 'Post Show Page' do
  let(:user) { create(:user, name: 'John Doe') }
  let(:post) { create(:post, title: 'Test Post', author: user, comments_counter: 2, likes_counter: 3) }
  let!(:comments) { create_list(:comment, 2, post:) }

  scenario 'displays post details and comments' do
    visit user_post_path(post.author, post)

    expect(page).to have_content(post.title)
    expect(page).to have_content("Post by: #{post.author.name}")
    expect(page).to have_content("Comments: #{post.comments_counter}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
    expect(page).to have_content(post.text)

    comments.each do |comment|
      expect(page).to have_content("Username: #{comment.user.name}")
      expect(page).to have_content(comment.text)
    end
  end

  scenario 'redirects to user posts page when clicking "Back to Posts"' do
    visit user_post_path(post.author, post)

    click_link 'Back to Posts'

    expect(current_path).to eq(user_posts_path(post.author))
  end
end

