class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details, comment: "ユーザー詳細" do |t|
      t.integer :gender, default: 0, comment: "性別"
      t.date :birthday, comment: "誕生日"
      t.references :prefecture, comment: "居住地ID"
      t.references :genre, comment: "好きなお菓子ジャンル"
      t.string :image, comment: "アカウント画像"
      t.text :introduction, comment: "自己紹介"
      t.integer :house_hold_id, comment: "世帯"
      t.integer :frequency_id, comment: "お菓子を食べる頻度"
      t.integer :criteria_id, comment: "お菓子購入の基準"
      t.integer :pay_id, comment: "月のお菓子の出費"
      t.integer :current_work_id, comment: "現在のご職業"
      t.timestamps
    end
  end
end
