FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    sequence(:id) { |n| n } #
    # other attributes for user

    factory :user_with_posts do
      transient do
        posts_count { 5 } # Adjust the number of posts as needed
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, author: user)
      end
    end
  end

  factory :post do
    title { 'First Post' }
    text { 'Post body 1' }
    likes_counter { 3 }
    comments_counter { 2 }
    association :author, factory: :user
  end
end
FactoryBot.define do
  factory :comment do
    user
    post
    text { 'This is a comment.' }
  end
end
