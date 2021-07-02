class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments, comment: 'コメント' do |t|
      t.references :user, foreign_key: true, null: false, comment: '会員ID'
      t.references :post, foreign_key: true, null: false, comment: '投稿ID'
      t.text :body, comment: '内容'
      t.timestamps
    end
  end
end
