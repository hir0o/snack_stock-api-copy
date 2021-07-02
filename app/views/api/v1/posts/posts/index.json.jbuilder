# 全投稿
json.posts @posts do |post|
  json.id post.id
  json.snack_name post.snack_name
  json.body post.body
  json.image post.image.url
  json.where_to_buy post.where_to_buy&.name
  json.time_ago_in_post "#{time_ago_in_words(post.created_at)}前に投稿"
  json.created_at l post.created_at, format: :short
  json.updated_at l post.updated_at, format: :short
  json.user do
    json.account_name post.user.detail.account_name
  end
end

# 注目の投稿
# json.trend @trend_posts do |post|
#   json.id  post.id
#   json.body post.body
#   json.image post.image.url
#   json.user do
#     json.account_name post.user.detail.account_name
#   end
# end
#
# # 最新の投稿
# json.new @new_posts do |post|
#   json.id post.id
#   json.body post.body
#   json.image post.image
#   json.user do
#     json.account_name post.user.detail.account_name
#   end
# end
