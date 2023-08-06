class Api::V1::PostCategoriesController < ApplicationController
  def index
    postcats = PostCategory.all
    render json: postcats, status: :ok
  end

  def show
    pos = PostCategory.where(params[:post_id])
    render json: pos, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end
end
