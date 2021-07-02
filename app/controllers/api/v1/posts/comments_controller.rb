module Api
  module V1
    module Posts
      class CommentsController < ApplicationController
        before_action :find_post
        before_action :correct_user, only: %i[destroy]
        skip_before_action :authenticate_request, only: %i[index]

        def index
          @comments = @post.comments
          render json: { status: :ok, data: @comments }
        end

        def create
          @post.comments.create!(controller_params)
          render json: { status: :created, data: @post.comments.last, message: '投稿のコメントに成功しました' }
        rescue ActiveRecord::RecordInvalid => e
          render json: { status: :unprocessable_entity, error: e.message }
        end

        def destroy
          comment = @post.comments.find(params[:id])
          comment.destroy!
          render json: { status: :ok, messasge: '削除が完了しました。' }
        rescue StandardError => e
          render json: { status: :bad_request, message: e.message }
        end

        private

          def controller_params
            params.fetch(:comment, {}).permit(:post_id, :body).merge(user: @current_user)
          end

          def id
            params[:post_id]
          end

          def correct_user
            render json: { message: '正しいユーザーでログインしてください', status: :forbidden } if @post.user != @current_user
          end

          def find_post
            @post = Post.find(id)
          end
      end
    end
  end
end
