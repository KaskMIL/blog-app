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

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split.last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
