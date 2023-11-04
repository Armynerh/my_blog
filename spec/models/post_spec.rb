require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'validates presence of title' do
    should validate_presence_of(:title)
  end

  it 'validates maximum length of title' do
    should validate_length_of(:title).is_at_most(250)
  end

  it 'validates comments_counter is a non-negative integer' do
    should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0).only_integer
  end

  it 'validates likes_counter is a non-negative integer' do
    should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0).only_integer
  end


  it 'has many likes' do
    should have_many(:likes)
  end

  it 'has many comments' do
    should have_many(:comments)
  end

end
