class RemoveColumnToUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :password_digest
    remove_column :users, :account_name
  end

  def down
    add_column :users, :password_digest, :string
    add_column :users, :account_name, :string
  end
end
