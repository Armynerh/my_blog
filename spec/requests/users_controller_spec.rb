require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success, renders correct template and right body of text' do
      get '/users'
      expect(response.body).to include('All Users')
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'returns http success, renders correct template and right body of text' do
      # Assuming you have a user with ID 1, adjust this ID accordingly
      user = FactoryBot.create(:user, name: 'Tom')

      get "/users/#{user.id}"
      expect(response.body).to include('Tom')
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end
end
