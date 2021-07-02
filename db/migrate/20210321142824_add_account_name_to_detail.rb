class AddAccountNameToDetail < ActiveRecord::Migration[6.1]
  def change
    add_column :details, :account_name, :string, comment: "アカウント名"
  end
end
