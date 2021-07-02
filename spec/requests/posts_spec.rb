require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # 作成
  describe '#GET /posts' do
    context '正しいリクエストを送信した場合' do
      it '200が返ってくること' do
        get '/api/v1/posts'
        expect(response.status).to eq 200
      end
    end
  end

  # 更新
  describe '#PUT /posts/:id' do
    context '妥当なパラメータの場合' do
      it '更新に成功すること' do
      end
    end

    context '未ログインでリクエストが送信された場合' do
      it '更新に失敗すること' do
      end
    end

    context '商品IDが不正な場合' do
      it '更新に失敗すること' do
      end
    end
  end

  # 削除
  describe 'DEL /posts/:id' do
    context '妥当なパラメータの場合' do
      it '削除に成功すること' do
      end
    end

    context '自分の投稿以外の場合' do
      it '削除に失敗すること' do
      end
    end
  end
end
