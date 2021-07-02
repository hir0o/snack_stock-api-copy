# == Schema Information
#
# Table name: details
#
#  id                               :bigint           not null, primary key
#  birthday(誕生日)                 :date
#  gender(性別)                     :integer          default(0)
#  image(アカウント画像)            :string(255)
#  introduction(自己紹介)           :text(65535)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  criteria_id(お菓子購入の基準)    :integer
#  current_work_id(現在のご職業)    :integer
#  frequency_id(お菓子を食べる頻度) :integer
#  genre_id(好きなお菓子ジャンル)   :bigint
#  house_hold_id(世帯)              :integer
#  pay_id(月のお菓子の出費)         :integer
#  prefecture_id(居住地ID)          :bigint
#  user_id                          :integer          not null
#
# Indexes
#
#  index_details_on_genre_id       (genre_id)
#  index_details_on_prefecture_id  (prefecture_id)
#
class Detail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  mount_uploader :image, DetailUploader
  # model associations
  belongs_to :user
  belongs_to :genre, optional: true
  belongs_to :prefecture, optional: true
  # active hash associations
  belongs_to_active_hash :criteria
  belongs_to_active_hash :current_work
  belongs_to_active_hash :frequency
  belongs_to_active_hash :house_hold
  belongs_to_active_hash :pay

  enum gender: {
    other: 0, # その他
    male: 1,  # 男性
    female: 2 # 女性
  }
end
