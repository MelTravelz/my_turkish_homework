class PromptSerializer
  include JSONAPI::Serializer
  attributes :image_id, :image_urls, :turkish_verb, :english_verb
end