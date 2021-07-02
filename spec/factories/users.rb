FactoryBot.define do
  factory :user, class: 'User' do
    account_name    { Faker::Internet.username }
    email           { Faker::Internet.email }
    password_digest { Faker::Crypto.md5 }

    trait :create_user_attributes do
      password { 'password' }
      password_confirmation { 'password' }
    end
  end
end
