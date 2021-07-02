# == Schema Information
#
# Table name: posts
#
#  id                        :bigint           not null, primary key
#  body(内容)                :text(65535)
#  image(画像)               :string(255)
#  snack_name(お菓子の名前)  :string(255)      not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  user_id(投稿ユーザー)     :bigint           not null
#  where_to_buy_id(購入場所) :integer
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  mount_uploader :image, PostUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to_active_hash :where_to_buy

  with_options presence: true do
    validates :snack_name
    validates :where_to_buy_id
    validates :body, length: { maximum: 999 }
  end

  class << self
    def search_filter(filtering_params)
      results = where(nil)
      filtering_params.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end
      results
    end

    # あとで変数名をリファクタ
    # def trend_posts
    #   pos = []
    #   r = fetch_trend_posts(:comments, :likes)
    #   r.each do |i|
    #     i.ids.map do |id|
    #       pos << find(id)
    #     end
    #   end
    #   pos
    # end

    # def fetch_trend_posts(*model_names)
    #   trend_posts = []
    #   model_names.each do |model|
    #     # post_idが多い順で取得 2番目まで
    #     trend_posts << joins(model).group('posts.id').order('count(post_id)').limit(5)
    #   end
    #   trend_posts.uniq
    # end
  end

  # 投稿名 & 投稿内容から曖昧検索
  scope :filter_by_keyword, ->(keyword) do
    find_by_sql([<<-SQL, "%#{keyword}%", "%#{keyword}%"])
      SELECT *
      FROM posts
      WHERE
        title LIKE ?
      OR
        body LIKE ?
    SQL
  end
end
