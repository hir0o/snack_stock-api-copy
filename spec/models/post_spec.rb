require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '全ての値が' do
    context '入力されている場合' do
      it '有効な状態であること' do
        post = build(:post)
        expect(post).to be_valid
      end
    end

    describe 'お菓子の名前(snack_name)の値が' do
      context '未入力の場合' do
        it '無効な状態であること' do
          post = build(:post, snack_name: '')
          post.valid?
          expect(post.errors[:snack_name]).to include('を入力してください')
        end
      end
    end
  end
end
