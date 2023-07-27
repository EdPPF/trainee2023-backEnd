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

  private
  def serializer(user)
    UserSerializer.new.serialize_to_json(user)
  end

end
