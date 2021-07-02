Post.destroy_all

user = User.create!(
  email:           'post-user@email.com',
)

user.create_detail!(
  account_name:    Faker::Internet.username,
)

Post.create!(
  user: user,
  body: 'おいしいとってもおいしい',
  image: 'sample.png',
  snack_name: 'コアラのマーチ',
  title: '美味しいがすぎる',
  where_to_buy_id: 1
)
Post.create!(
  user: user,
  body: 'おいしいとってもあまくて、、、',
  image: 'sample.png',
  snack_name: 'トッポ',
  title: '少ししょっぱい',
  where_to_buy_id: 1
)
Post.create!(
  user: user,
  body: '今日はなんだかいい気分',
  image: 'sample.png',
  snack_name: 'ガルボミニ',
  title: '食感がよい',
  where_to_buy_id: 1
)
Post.create!(
  user: user,
  body: '食べ過ぎ注意だし少し油っぽいかも',
  image: 'sample.png',
  snack_name: 'ポテトチップス',
  title: '食べ応えがあってすぐ太る食べ物',
  where_to_buy_id: 1
)