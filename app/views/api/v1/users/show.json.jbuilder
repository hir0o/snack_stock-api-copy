json.user do
  json.email @user.email
  json.detail do
    json.account_name @user.detail.account_name
    json.birthday @user.detail.birthday
    json.gender @user.detail.gender
    json.image @user.detail.image
    json.introduction @user.detail.introduction
    json.criteria @user.detail.criteria&.name
    json.current_work @user.detail.current_work&.name
    json.frequency @user.detail.frequency&.name
    json.house_hold @user.detail.house_hold&.name
    json.pay @user.detail.pay&.name
    json.prefecture @user.detail.prefecture&.name
    json.genre do
      json.genre_name @user.detail.genre&.name
      json.genre_taste @user.detail.genre&.taste
    end
  end
end
