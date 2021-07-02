class AddDeletedAtToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :deleted_at, :datetime, comment: '削除日時'
  end
end
