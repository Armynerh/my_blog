require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success, renders correct template and right body of text' do
      get '/users'
      expect(response.body).to include('Here is a list of all Users')

      expect(response.status).to eq(200)

      expect(response).to render_template(:index)
    end
  end
  describe 'GET /index' do
    it 'returns http success, renders correct template and right body of text' do
      get '/users/:id'
      expect(response.body).to include('User 1 profile')

      expect(response.status).to eq(200)

      expect(response).to render_template(:show)
    end
  end
end
