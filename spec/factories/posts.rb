FactoryBot.define do
  factory :post do
    body { 'おいしいとってもおいしい' }
    image { 'sample.png' }
    snack_name { 'コアラのマーチ' }
    title { '美味しいがすぎる' }
    where_to_buy_id { 1 }
    association :user
  end
end
