class UserSerializer < Panko::Serializer
  attributes :id, :name, :email, :authentication_token, :is_admin

  def profile_pictures_url
    array = []
    if object.images.attached?
      object.images.each do |image|
        array.append Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
      end
    end
    return array
  end

end
