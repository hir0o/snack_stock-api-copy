module Api
  module V1
    class PasswordResetsController < ApplicationController
      skip_before_action :authenticate_request, only: %i[create update]

      # POST /password_resets
      def create
        ActiveRecord::Base.transaction do
          user = User.find_by!(email: email_params[:email])
          user.create_reset_token
          user.send_password_reset_email
          render json: { status: :ok, message: 'パスワードリセットのメールを送信しました。' }
        end
      rescue ActiveRecord::RecordNotFound => e
        render json: { status: :not_found, error: e.message }
      end

      # PUT /password_resets
      def update
        user = User.find_by!(reset_token: change_password_params[:reset_token])
        render json: { status: :unauthorized, message: 'トークンが違います' } if user.password_reset_expired?
        user.update!(change_password_params)
        render json: { status: :ok, message: 'パスワードの更新に成功しました。' }
      rescue ActiveRecord::RecordNotFound => e
        render json: { status: :not_found, error: e.message }
      rescue ActiveRecord::RecordInvalid => e
        render json: { status: :unprocessable_entity, message: e.message }
      end

      private

        def email_params
          params.permit(:email)
        end

        def change_password_params
          params.fetch(:user, {}).permit(:password, :password_confirmation, :reset_token)
        end
    end
  end
end
