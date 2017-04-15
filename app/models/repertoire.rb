class Repertoire < ApplicationRecord
  validates_presence_of :title, :description, :first_image, :second_image
  mount_uploader :first_image, RepertoireFirstImageUploader
  mount_uploader :second_image, RepertoireSecondImageUploader

end
