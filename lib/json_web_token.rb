class JsonWebToken
  class << self
    # generated user token
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    # corrected user token
    def decode(token)
      body = FirebaseIdToken::Signature.verify(token)
      # body = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'RS256' })[0]
      HashWithIndifferentAccess.new body
    rescue StandardError
      nil
    end
  end
end
