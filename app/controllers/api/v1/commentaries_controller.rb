class Api::V1::CommentariesController < ApplicationController
  acts_as_token_authentication_handler_for User, only:[:create, :update, :delete]
  # before_action :admin_authentication, only:[:create, :update, :delete]

  def create
    commen = Commentary.new(commentary_params)
    commen.save!
    render json: serializer(commen), status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def index
    comments = Commentary.all
    render json: array_serializer(comments), status: :ok
  end

  def show
    comme = Commentary.find(params[:id])
    render json: serializer(comme), status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  def update
    comm = Commentary.find(params[:id])
    comm.update!(commentary_params)
    render json: serializer(comm), status: :ok
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def delete
    come = Commentary.find(params[:id])
    come.destroy!
    render json: {message: "Object destroyed."}, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  private
  def commentary_params
    params.require(:commentary).permit(:content, :user_id, :post_id)
  end

  def serializer(comentario)
    CommentarySerializer.new.serialize_to_json(comentario)
  end

  def array_serializer(comentarios)
    Panko::ArraySerializer.new(comentarios, each_serializer: CommentarySerializer).to_json
  end
end
