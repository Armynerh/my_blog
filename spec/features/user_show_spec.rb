require 'rails_helper'
require 'capybara'

RSpec.feature 'User Show' do
  let(:user5) { User.create(name: 'Amanda', bio: 'Bio text 1', photo: 'https://source.unsplash.com/featured/300x203') }

  let!(:post1) do
    Post.create(title: 'First post', text: 'test text', author_id: user5.id, comments_counter: 0, likes_counter: 0)
  end
  let!(:post2) do
    Post.create(title: 'Second post', text: 'test text', author_id: user5.id, comments_counter: 0, likes_counter: 0)
  end
  let!(:post3) do
    Post.create(title: 'Third post', text: 'test text', author_id: user5.id, comments_counter: 0, likes_counter: 0)
  end

  scenario 'viewing user details' do
    visit user_path(user5)

    expect(page).to have_css("img[src*='#{user5.photo}']", count: 1) # Assuming user.photo is the URL for the photo
    expect(page).to have_content(user5.name)
    expect(page).to have_content(user5.bio)
    expect(page).to have_content(user5.posts_counter)
    expect(page).to have_link('See All Posts', href: user_posts_path(user5))
  end

  scenario 'displays the users first 3 posts' do
    visit user_path(user5)
    expect(page).to have_content('Third post')
    expect(page).to have_content('Second post')
    expect(page).to have_content('First post')
  end

  scenario 'clicking to see all posts redirects to the user post index page' do
    visit user_path(user5)
    click_link 'See All Posts'

    expect(page).to have_current_path(user_posts_path(user5))
  end
end
