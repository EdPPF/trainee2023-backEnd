class Api::V1::UsersController < ApplicationController

  def login
    user = User.find_by(email: params[:email])
    if user.valid_password?(params[:password])
      render json: serializer(user), status: :ok
    else
      head :unauthorized
    end
    rescue StandardError
      head :unauthorized
  end

  def show
    user = User.find(params[:id])
    render json: serializer(user), status: :ok
  rescue StandardError
    head(:not_found)
  end

  def find_by_email
    user = User.find_by!(email: params[:email]+".com")
    # user = User.where(email: params[:email]+".com").ids[0]
    render json: serializer(user), status: :ok
  # rescue StandardError
  #   head(:not_found)
  end

  def create
    user = User.new(user_params)
    user.save!
    render json: serializer(user), status: :created
    # render json: User.create!(user_params), status: :created
  # rescue StandardError => e
  #   render json: e, status: :bad_request
  end

  private
  def serializer(user)
    UserSerializer.new.serialize_to_json(user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
