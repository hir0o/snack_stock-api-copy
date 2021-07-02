require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:valid_params) { attributes_for(:comment) }

  describe 'GET /comments' do
    # context '妥当なパラメータが送信された場合' do
    #   it 'リクエストに成功すること' do
    #     get "/api/v1/post/#{post.id}/comments"
    #     expect(response.status).to eq 200
    #   end
    # end

    context '不正なパラメータが送信された場合' do
      it 'リクエストに失敗すること' do
      end
    end
  end

  # コメントの投稿
  describe 'POST /comments' do
    context '正しいリクエストが送信された場合' do
      it 'リクエストが成功すること' do
      end
    end
  end
end
