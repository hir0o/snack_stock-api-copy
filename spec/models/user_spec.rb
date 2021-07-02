# == Schema Information
#
# Table name: users
#
#  id                           :bigint           not null, primary key
#  account_name(アカウント名)   :string(255)      not null
#  email(メールアドレス)        :string(255)      not null
#  password_digest(パスワード)  :string(255)      not null
#  remember_token(トークン記憶) :string(255)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:duplicate_user) { create(:user, email: 'duplicate@example.com') }

  # account_name
  describe 'アカウント名(account_name)の値が' do
    context '入力されている場合' do
      it '有効であること' do
        user = build(:user, account_name: 'hoge')
        expect(user).to be_valid
      end
    end

    context '文字数が1文字の場合' do
      it '有効であること' do
        user = build(:user, account_name: 'a')
        expect(user).to be_valid
      end
    end

    context '未入力の場合' do
      it '無効であること' do
        user = build(:user, account_name: '')
        user.valid?
        expect(user.errors[:account_name]).to include('を入力してください')
        expect(user.errors[:account_name]).to include('は1文字以上で入力してください')
      end
    end
  end
  # email

  describe 'メールアドレス(email)の値が' do
    context '入力されている場合' do
      it '有効であること' do
        user = build(:user, email: 'test@example.com')
        expect(user).to be_valid
      end
    end

    context '未入力の場合' do
      it '無効であること' do
        user = build(:user, email: '')
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
        expect(user.errors[:email]).to include('は不正な値です')
      end
    end

    context 'Emailが重複している場合' do
      it '無効であること' do
        duplicate_user
        user = build(:user, email: 'duplicate@example.com')
        user.valid?
        expect(user.errors[:email]).to include('はすでに存在します')
      end
    end
  end
  # password

  describe 'パスワード(password_digest)の値が' do
    context '入力されている場合' do
      it '有効であること' do
        user = build(:user, password_digest: 'DmiSq234dE9dfkjD')
        expect(user).to be_valid
      end
    end

    context '未入力である場合' do
      it '無効であること' do
        user = build(:user, password_digest: '')
        user.valid?
        expect(user.errors[:password_digest]).to include('を入力してください')
        expect(user.errors[:password_digest]).to include('は6文字以上で入力してください')
      end
    end
  end
end
