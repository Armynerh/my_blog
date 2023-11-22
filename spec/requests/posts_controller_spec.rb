require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'Posts', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user:) }

  describe 'GET /users/:user_id/posts' do
    it 'responds with a 200 status' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Back to Users') # Adjust this expectation based on your actual response
      expect(response).to render_template(:index)
    end
  end
end
