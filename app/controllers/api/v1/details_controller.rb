module Api
  module V1
    class DetailsController < ApplicationController
      def update
        detail = @current_user.detail
        detail.update!(controller_params)
        render json: { status: :ok, data: detail, message: 'ユーザー詳細情報を更新しました' }
      rescue ActiveRecord::RecordInvalid => e
        render json: { satus: :unprocessable_entity, error: e.message }
      end

      private

        def controller_params
          params.fetch(:detail, {}).permit(
            :account_name,
            :birthday,
            :gender,
            :image,
            :introduction,
            :criteria_id,
            :current_work_id,
            :frequency_id,
            :prefecture_id,
            :house_hold_id,
            :pay_id,
            :genre_id
          )
        end
    end
  end
end
