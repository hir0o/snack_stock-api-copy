class PasswordResetsMailer < ApplicationMailer
  def send_to_user(user)
    @user = user
    mail(from: 'owner@email.com',
         to: @user.email.to_s,
         subject: '【SNACKSTOCK】パスワード変更リンクはこちらから',
         template_path: 'password_resets_mailer',
         template_name: 'reset_mail')
  end
end
