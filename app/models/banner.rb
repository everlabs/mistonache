class Banner < ApplicationRecord
  POSITION = {
      top: 1,
      bottom: 2,
      right: 3,
      kinoshot: 4,
      right_second: 5
  }
  VALID_LINK = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

  validates :image, presence: true
  validates :url, presence: true,
            format: { with: VALID_LINK }

  mount_uploader :image, BannerUploader
  scope :by_kinoshot, -> { where("position = ?", Banner::POSITION[:kinoshot]) }
end
