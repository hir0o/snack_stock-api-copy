module Api
  module V1
    module Posts
      class LikesController < ApplicationController
        skip_before_action :authenticate_request, only: %i[index] # とりあえず認証はスキップする
        before_action :find_post, only: %i[index create destroy]
        before_action :without_myself?, only: %i[create]
        # before_action :match_myself?, only: %i[destroy]

        def index
          @likes = Like.preload(user: :detail).where(post_id: @post.id)
          render 'index', formats: :json, handler: 'jbuilder'
        end

        def create
          @post.likes.create!(user: @current_user)
          render json: { status: :ok, message: 'いいねしました。' }
        rescue ActiveRecord::RecordInvalid => e
          render json: { status: :found, error: e.message }
        end

        def destroy
          like = @post.likes.find_by!(user_id: @current_user)
          like.destroy!
        rescue ActiveRecord::RecordInvalid => e
          reder json: { status: :bad_request, error: e.message }
        end

        private

          def id
            params[:post_id]
          end

          def find_post
            @post = Post.find(id)
          rescue ActiveRecord::RecordNotFound => e
            render json: { status: :not_found, error: e.message }
          end

          # 自分の投稿にいいね禁止
          def without_myself?
            return if @post.user != @current_user

            render json: { status: :unauthorized, message: '自分の投稿にはいいねができません。' }
          end

          # 自分のしたいいねのみ削除OK
          def match_myself?
            return unless @post.user != @current_user

            render json: { status: :unauthorized, message: '自分以外のいいねは削除できません。' }
          end
      end
    end
  end
end
