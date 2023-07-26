class Api::V1::CategoriesController < ApplicationController
  def create
    categor = Category.new(category_params)
    categor.save!
    render json: serializer(categor), status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def index
     categs = Category.all
     render json: array_serializer(categs), status: :ok
  end

  def show
    categ = Category.find(params[:id])
    render json: serializer(categ), status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  def update
    categ = Category.find(params[:id])
    categ.update!(category_params)
    render json: serializer(categ), status: :ok
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def delete
    cat = Category.find(params[:id])
    cat.destroy!
    render json: {message: "Object destroyed."}, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  private
    def category_params
      params.require(:category).permit(:name, :description)
    end

    def serializer(categoria)
      CategorySerializer.new.serialize_to_json(categoria)
    end

    def array_serializer(categorias)
      Panko::ArraySerializer.new(categorias, each_serializer: CategorySerializer).to_json
    end
end
