class Api::V1::PostsController < ApplicationController
  # acts_as_token_authentication_handler_for User, only:[:create, :update, :delete]
  # before_action :admin_authentication, only:[:create, :update, :delete]

  def create
    post = Post.new(post_params)
    post.save!
    render json: serializer(post), status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def index
    posts = Post.all
    render json: array_serializer(posts), status: :ok
  end

  def show
    pos = Post.find(params[:id])
    render json: serializer(pos), status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  def update
    pos = Post.find(params[:id])
    pos.update!(post_params)
    render json: serializer(pos), status: :ok
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def delete
    pos = Post.find(params[:id])
    pos.destroy!
    render json: {message: "Object destroyed."}, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def serializer(post)
      PostSerializer.new.serialize_to_json(post)
    end

    def array_serializer(posts)
      Panko::ArraySerializer.new(posts, each_serializer: PostSerializer).to_json
    end
end
