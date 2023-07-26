class CommentarySerializer < Panko::Serializer
  attributes :content#, :user, :post

  # has_one :user, serializer: UserSerializer

  # def post
  #   object.post
  # end
end
