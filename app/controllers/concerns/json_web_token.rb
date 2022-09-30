require 'jwt'

module JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base

  def jwt_encode(payload, exp = 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode
    decode = JWT.decode(token, secret_key)[0]
    HashWithIndifferentAccess.new decode
  end
end
