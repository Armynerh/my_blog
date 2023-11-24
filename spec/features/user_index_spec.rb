require 'rails_helper'

RSpec.feature 'User Integration', type: :feature do
  let!(:user3) { create(:user, name: 'Mart', photo: 'https://images.unsplash.com/photo-1504199367641-aba8151af406?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fGJsYWNrJTIwcGVvcGxlfGVufDB8fDB8fHww') }
  let!(:user4) { create(:user, name: 'Sasha', photo: 'https://images.unsplash.com/photo-1589156229687-496a31ad1d1f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGJsYWNrJTIwcGVvcGxlfGVufDB8fDB8fHww') }

  context 'User index page' do
    scenario 'displays user information' do
      visit users_path

      expect(page).to have_content('All Users')
      within('.user-list') do
        expect(page).to have_css('.user-card', count: 2)
        expect(page).to have_css('.user-picture img', count: 2)
        expect(page).to have_content('Mart')
        expect(page).to have_content('Sasha')
        expect(page).to have_content('0 posts')
        expect(page).to have_content('0 posts')
      end
    end

    scenario 'redirects to user show page when clicking on a user' do
      visit users_path

      within('.user-list') do
        first('.user-card a').click
      end

      expect(current_path).to eq(user_path(user3))
    end
  end
end
