class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      t.string :name, comment: "都道府県名"
      t.string :slug, commemt: "kana"

      t.timestamps
    end
  end
end
