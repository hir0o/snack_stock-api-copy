json.likes @likes do |like|
  json.id like.id
  json.user do
    json.id like.user.uid
    json.account_name like.user.detail.account_name
    json.image like.user.detail.image.url
  end
end
