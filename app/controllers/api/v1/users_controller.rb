module Api
  module V1
    class UsersController < ApplicationController
      include Firebase::Auth::Authenticable
      skip_before_action :authenticate_request, only: %i[create]
      skip_before_action :deleted_at?, only: %i[show create]
      before_action :set_user, only: %i[show update destroy]

      def show
        render 'show', formats: :json, handler: 'jbuilder'
      end

      # POST /auth
      def create
        FirebaseIdToken::Certificates.request
        raise ArgumentError, 'BadRequest Parameter' if payload.blank?

        @user = User.find_or_initialize_by(uid: payload['sub'], email: payload['email'])
        if @user.save
          @user.create_detail!
          render json: @user, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PUT /users
      def update
        @user.update!(controller_params)
        render json: { status: :found, user: @user, message: '基本情報の更新が完了しました' }
      rescue StandardError => e
        render json: { status: :bad_request, error: e.message, message: '更新に失敗しました' }
      end

      # DELETE /users
      def destroy
        @user.update!(deleted_at: Time.zone.now)
        render json: { status: :ok, user: @user, message: '退会処理が完了しました' }
      rescue StandardError => e
        render json: { status: :bad_request, error: e.message, message: '退会に失敗しました' }
      end

      private

        def controller_params
          params.permit(:email)
        end

        def set_user
          @user = @current_user
        end

        # === TODO: Refactor
        def token_from_request_headers
          request.headers['Authorization']&.split&.last
        end

        def token
          params[:token] || token_from_request_headers
        end

        def payload
          @payload ||= FirebaseIdToken::Signature.verify(token)
        end
        # ==========
    end
  end
end
