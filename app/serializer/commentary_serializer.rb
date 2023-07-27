class CommentarySerializer < Panko::Serializer
  attributes :content, :user_id, :post_id

  # has_one :user, serializer: UserSerializer

  # def post
  #   object.post
  # end
end
