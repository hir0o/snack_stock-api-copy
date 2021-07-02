# BASE URL /api/v1
module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_request, only: %i[create]
      skip_before_action :deleted_at?, only: %i[create]

      # POST /login
      def create
        command = AuthenticateUser.call(
          controller_params[:email],
          controller_params[:password]
        )
        if command.success?
          response.headers['X-Authentication-Token'] = command.result
          render json: { status: :ok, user: command.call.send(:user), message: 'ログインに成功しました' }
        else
          render json: { status: :unauthorized, error: command.errors, message: 'ログインに失敗しました' }
        end
      rescue ActiveRecord::RecordNotFound => e
        render json: { status: :bad_request, error: e.message, message: 'ユーザーが見つかりません' }
      end

      private

        def controller_params
          params.fetch(:session, {}).permit(:email, :password)
        end
    end
  end
end
