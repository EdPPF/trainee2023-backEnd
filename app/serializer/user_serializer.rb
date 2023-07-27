class UserSerializer < Panko::Serializer
  attributes :id, :name, :email, :authentication_token #, :profile_picture_url
end
