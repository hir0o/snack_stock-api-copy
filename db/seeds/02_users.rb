User.destroy_all

user = User.create!(
  email:           'example-user@email.com',
)
user.create_detail!(
  account_name:    Faker::Internet.username,
)
