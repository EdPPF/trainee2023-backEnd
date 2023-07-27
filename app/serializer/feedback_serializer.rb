class FeedbackSerializer < Panko::Serializer
  attributes :like, :post_id, :user_id
end
