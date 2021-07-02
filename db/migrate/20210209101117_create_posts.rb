class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true, comment: "投稿ユーザー"
      t.string :title, comment: "タイトル"
      t.string :snack_name, null: false, comment: "お菓子の名前"
      t.text :body, comment: "内容"
      t.integer :where_to_buy_id, comment: "購入場所"
      t.string :image, comment: "画像"

      t.timestamps
    end
  end
end
