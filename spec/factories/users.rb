# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'Emily Roberts' }
    email { 'emmy@mailme.com' }
    id { 1 }
  end
end
