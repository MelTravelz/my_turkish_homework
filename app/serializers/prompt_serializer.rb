class PromptSerializer
  include JSONAPI::Serializer
  attributes :image_urls, :image_id
end