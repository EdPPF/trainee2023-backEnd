class PostSerializer < Panko::Serializer
  attributes :title, :content, :id, :images_url

  def images_url
    array = []
    if object.images.attached?
      object.images.each do |image|
        array.append Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
      end
    end
    return array
  end

end
