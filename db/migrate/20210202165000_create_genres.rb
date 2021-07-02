class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres, comment: "お菓子のジャンル" do |t|
      t.string :name, comment: "ジャンル名"
      t.integer :taste, default: 0, comment: "テイスト"
      t.timestamps
    end
  end
end
