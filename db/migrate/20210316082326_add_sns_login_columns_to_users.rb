class AddSnsLoginColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :provider, :string, comment: "プロバイダ"
    add_column :users, :uid, :string, comment: "SNSユーザーID"
    add_index :users, %i[uid provider], unique: true
  end
end
