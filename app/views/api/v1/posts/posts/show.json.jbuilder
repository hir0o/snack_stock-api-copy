json.post do
  json.id @post.id
  json.body @post.body
  json.image @post.image.url
  json.snack_name @post.snack_name
  json.where_to_buy @post.where_to_buy&.name
  json.time_ago_in_post "#{time_ago_in_words(@post.created_at)}に投稿"
  json.user do
    json.user_id @post.user_id
    json.uid @post.user.uid
    json.name @post.user.detail.account_name
    json.image @post.user.detail.image
  end
  json.comments @post.comments do |comment|
    json.id comment.id
    json.comment comment.body
    json.created_at "#{time_ago_in_words(comment.created_at)}前に投稿"
    json.updated_at comment.updated_at
    json.user do
      json.account_name comment.user.detail.account_name
      json.image comment.user.detail.image.url
    end
  end
end
