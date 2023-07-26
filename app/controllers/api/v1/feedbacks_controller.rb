class Api::V1::FeedbacksController < ApplicationController
  # acts_as_token_authentication_handler_for User, only:[:create, :update, :delete]
  # before_action :admin_authentication, only:[:create, :update, :delete]

  def create
    feed = Feedback.new(feedback_params)
    feed.save!
    render json: serializer(feed), status: :created
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def index
    feedbs = Feedback.all
    render json: array_serializer(feedbs), status: :ok
  end

  def show
    feedb = Feedback.find(params[:id])
    render json: serializer(feedb), status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  def update
    fedd = Feedback.find(params[:id])
    fedd.update!(feedback_params)
    render json: serializer(fedd), status: :ok
  rescue StandardError => e
    render json: e, status: :bad_request
  end

  def delete
    fee = Feedback.find(params[:id])
    fee.destroy!
    render json: {message: "Object destroyed."}, status: :ok
  rescue StandardError => e
    render json: e, status: :not_found
  end

  private
    def feedback_params
      params.require(:feedback).permit(:like, :user_id, :post_id)
    end

    def serializer(feedback)
      FeedbackSerializer.new.serialize_to_json(feedback)
    end

    def array_serializer(feedbacks)
      Panko::ArraySerializer.new(feedbacks, each_serializer: FeedbackSerializer).to_json
    end
end
