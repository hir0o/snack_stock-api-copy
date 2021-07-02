class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes, comment: 'いいね' do |t|
      t.references :post, foreign_key: true, comment: '投稿ID'
      t.references :user, foreign_key: true, comment: '会員ID'

      t.timestamps
    end
  end
end
