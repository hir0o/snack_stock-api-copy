class ApplicationController < ActionController::API
  before_action :authenticate_request
  before_action :deleted_at?
  attr_reader :current_user

  def create_remember_token(user)
    remember_token = User.new_remenber_token
    cookies.permanent[:user_remember_token] = remember_token
    user.update!(remember_token: User.encrypt(remember_token))
  end

  private

    def authenticate_request
      @current_user = AuthorizeApiRequest.call(request.headers).result
    end

    def deleted_at?
      return if @current_user.nil?

      render json: { status: :unauthorized, message: '既に退会済みです' } if @current_user.deleted_at.present?
    end
end
