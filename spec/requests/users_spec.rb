require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:valid_params) { attributes_for(:user, :create_user_attributes) }

  # 登録
  describe 'POST /auth' do
    context '妥当なパラメータの場合' do
      it '登録に成功すること' do
        expect do
          post '/api/v1/auth', params: valid_params
        end.to change(User, :count).by(+1)
      end
    end
  end

  # 詳細
  describe 'GET /users/:id' do
    context '妥当なパラメータの場合' do
      it 'リクエストが成功すること' do
      end
    end
  end

  # 更新
  describe 'PUT /users/:id' do
    context '妥当なパラメータの場合' do
      it '更新に成功すること' do
      end
    end

    context 'ユーザーが違う場合' do
      it '更新に失敗すること' do
      end
    end

    context '未ログイン状態の場合' do
      it '更新に失敗すること' do
      end
    end
  end

  # 退会
  describe 'DEL /users/:id' do
    context '妥当なパラメータの場合' do
      it '退会に成功すること' do
      end
    end

    context '既に退会しているユーザーの場合' do
      it '退会が拒否されること' do
      end
    end
  end
end
