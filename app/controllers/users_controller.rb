class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(email: params[:email], password: params[:password])

    if user.save
      token = encode_token(user.id)
      render json: { user: user, token: token }
    else
      render json: { errors: user.errors.full_messages }
    end
    # end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def edit
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    # byebug
    if user.update(user_params)
      render json: user
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_name,
      :address
    )
  end
end
