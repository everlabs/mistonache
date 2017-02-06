class Banner < ApplicationRecord
  POSITION = {
      top: 1,
      bottom: 2,
      right: 3
  }

  validates :image, presence: true
  validates :position, uniqueness: true


  mount_uploader :image, BannerUploader
end
