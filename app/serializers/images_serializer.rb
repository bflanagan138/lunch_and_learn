class ImagessSerializer
  include JSONAPI::Serializer
    attributes  :alt_tag,
                :url
  end