class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :account_name, null: false, comment: "アカウント名"
      t.string :email, null: false, comment: "メールアドレス"
      t.string :password_digest, null: false, comment: "パスワード"
      t.string :remember_token, comment: "トークン記憶"
      t.timestamps
    end
  end
end
