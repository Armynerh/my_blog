require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'belongs to a user' do
    should belong_to(:user)
  end

  it 'belongs to a post' do
    should belong_to(:post)
  end
end
