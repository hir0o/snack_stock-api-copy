# == Schema Information
# 好きなお菓子のジャンル
# Table name: genres
#
#  id               :bigint           not null, primary key
#  name(ジャンル名) :string(255)
#  taste(テイスト)  :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Genre < ApplicationRecord
  has_many :details, dependent: :destroy

  enum taste: {
    sweet: 0,  # 甘い
    hot: 1,    # 辛い
    salty: 2,  # しょっぱい
    sour: 3,   # 酸っぱい
    bitter: 4, # 苦い
    mild: 5    # まろやか
  }
end
