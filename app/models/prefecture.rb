# == Schema Information
#
# Table name: prefectures
#
#  id               :bigint           not null, primary key
#  name(都道府県名) :string(255)
#  slug             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Prefecture < ApplicationRecord
  has_many :details, dependent: :destroy
end
