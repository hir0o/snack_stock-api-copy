module Api
  module V1
    module Posts
      class PostsController < ApplicationController
        skip_before_action :authenticate_request, only: %i[show index]
        before_action :set_post, only: %i[show update destroy]
        before_action :correct_user, only: %i[update destroy]

        def index
          @posts = Post.preload(user: :detail).search_filter(search_params)
          # @trend_posts = Post.trend_posts
          # @new_posts = Post.where(created_at: 1.week.ago.all_day)
          render 'index', formats: :json, handler: 'jbuilder'
        end

        def show
          @comments = @post.comments
          render 'show', formats: :json, handler: 'jbuilder'
        end

        def create
          post = Post.create!(controller_params)
          render json: { status: :ok, data: post, message: '投稿を作成しました。' }
        rescue ActiveRecord::RecordInvalid => e
          render json: { status: :unprocessable_entity, error: e.message }
        end

        def update
          @post.update!(controller_params)
          render json: { status: :found, data: @post, message: '投稿を更新しました。' }
        rescue ActiveRecord::RecordInvalid => e
          render json: { status: :unprocessable_entity, error: e.message }
        end

        def destroy
          @post.destroy!
          render json: { status: :ok, message: '投稿を削除しました。' }
        rescue StandardError => e
          render json: { status: :bad_request, message: e.message }
        end

        private

          def controller_params
            params.fetch(:post, {}).permit(
              :snack_name,
              :body,
              :image,
              :where_to_buy_id
            ).merge(user: @current_user)
          end

          def search_params
            params.permit(:keyword)
          end

          def correct_user
            render json: { message: '正しいユーザーでログインしてください', status: :forbidden } if @post.user != @current_user
          end

          def set_post
            @post = Post.find(id)
          end

          def id
            params[:id]
          end
      end
    end
  end
end
