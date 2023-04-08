class Homework < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, 
                        :language,
                        :theme_image,
                        :word_prompt
end