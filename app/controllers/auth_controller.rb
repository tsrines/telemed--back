class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = encode_token(user.id)
      render json: { user: user, token: token }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def auto_login
    if session_user
      render json: session_user
    else
      render json: { errors: ['Please log in again'] }
    end
  end
end
