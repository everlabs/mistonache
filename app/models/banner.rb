class Banner < ApplicationRecord
  POSITION = {
      top: 1,
      bottom: 2,
      right: 3,
      kinoshot: 4
  }

  validates :image, presence: true

  mount_uploader :image, BannerUploader
  scope :by_kinoshot, -> { where("position = ?", Banner::POSITION[:kinoshot]) }
end
