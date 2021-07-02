class AuthorizeApiRequest
  include Firebase::Auth::Authenticable
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

    attr_reader :headers

    def user
      @user ||= User.where(uid: decoded_auth_token['user_id'], email: decoded_auth_token['email']).last if decoded_auth_token
      @user ||= errors.add(:token, 'Invalid token') && nil
    end

    def decoded_auth_token
      @decoded_auth_token ||= FirebaseIdToken::Signature.verify(http_auth_header)
    end

    # @return [token]
    def http_auth_header
      return errors.add(:token, 'Missing Token') if headers['Authorization'].blank?

      headers['Authorization'].split(' ').last
    end
end
