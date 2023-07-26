class PostSerializer < Panko::Serializer
  attributes :title, :content, :id

  # def image_url
  #   Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true) if object.image.attached?
  # end
end
