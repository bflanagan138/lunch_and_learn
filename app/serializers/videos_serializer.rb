class VideosSerializer
  include JSONAPI::Serializer
    attributes  :title,
                :youtube_video_id
  end