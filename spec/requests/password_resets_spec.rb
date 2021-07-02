# require 'rails_helper'

# RSpec.describe 'PasswordResets', type: :request do
#   let!(:user) { create(:user) }

#   describe 'POST /password_resets' do
#     context '正しいリクエストが送信された場合' do
#       it 'リクエストが成功すること' do
#         post '/password_resets', params: { email: user.email }
#         expect(response.status).to eq 200
#       end
#     end
#   end

#   # ここ後回し
#   describe 'PUT /password_resets' do
#     context '正しい更新リクエストが送信された場合' do
#       it 'パスワードの更新に成功すること' do
#         put '/password_resets', params: { password: 'password', passsword_confirmation: 'password', reset_token: user.reset_token }
#         expect(response.status).to eq 200
#       end
#     end

#     context '確認パスワードが一致しない場合' do
#       it 'パスワードの更新に失敗すること' do
#         put '/password_resets', params: { password: 'password', passsword_confirmation: 'hogehoge', reset_token: user.reset_token }
#         expect(response.status).to eq 200
#       end
#     end

#     context 'トークンが不正な場合' do
#       it 'パスワードの更新に失敗すること' do
#         put '/password_resets', params: { password: 'password', passsword_confirmation: 'password', reset_token: 'hogehoge' }
#         expect(response.status).to eq 200
#       end
#     end
#   end
# end
