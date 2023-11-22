# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'Emily Roberts' }
    sequence(:id) { |n| n } # Use a sequence for unique IDs
  end
end

# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    title { 'Sample Title' }
    text { 'Sample Text' }
    sequence(:id) { |n| n } # Use a sequence for unique IDs
    comments_counter { 1 }
    likes_counter { 0 }
    author_id { 1 }
    created_at { '2020-02-02' } # Use a valid date format
    updated_at { '2020-02-02' } # Use a valid date format
    association :user, factory: :user

    # other post attributes
  end
end
