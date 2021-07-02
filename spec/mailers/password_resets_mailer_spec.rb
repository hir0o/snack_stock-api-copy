require 'rails_helper'

RSpec.describe PasswordResetsMailer, type: :mailer do
  subject(:send_to_mail) { described_class.send_to_user(user) }

  let(:user) { create(:user, email: 'sample@example.com') }

  describe 'パスワード変更メール' do
    context '送信されたEmailのユーザーが存在している場合' do
      it 'リセットメールが送信されること' do
        expect(send_to_mail.to).to eq [user.email.to_s]
        expect(send_to_mail.from).to eq ['owner@email.com']
        expect(send_to_mail.subject).to eq '【SNACKSTOCK】パスワード変更リンクはこちらから'
      end
    end
  end
end
