require 'rails_helper'

RSpec.describe 'Post Index Page', type: :feature do
  let(:user) { create(:user, name: 'Ama', bio: 'new', photo: 'https://images.unsplash.com/photo-1510736769521-207ed84f191e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGJsYWNrJTIwcGVvcGxlfGVufDB8fDB8fHww') }
  let!(:post) { create(:post, title: 'post 1', author: user, comments_counter: 1) }
  let!(:post2) { create(:post, title: 'post 2', author: user) }

  it 'displays user information and post details' do
    visit user_posts_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content(user.posts_counter)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
    expect(page).to have_content('post 1') # First comment on the post
    expect(page).to have_content("Comments: #{post.comments_counter}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  it 'redirects to a post show page when clicking on a post' do
    visit user_posts_path(user)
    click_link 'post 1'
    expect(current_path).to eq(user_post_path(user, post))
  end

  it 'displays a button for pagination' do
    visit user_posts_path(user)
    expect(page).to have_selector('.pagination')
  end
end

