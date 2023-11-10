require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'responds with a 200 status' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Here is a list of posts for user #1')
      expect(response).to render_template(:index)
    end
  end
  describe 'GET /users/:user_id/posts/:id' do
    it 'responds with a 200 status' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('post #1 by user #1')
      expect(response).to render_template(:show)
    end
  end
end
