class Announcement < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :main_image, presence: true
  validates :title, length: { in: 10..60 }
  validates :body, length: { minimum: 150 }

  belongs_to :admin_user

  mount_uploader :main_image, MainImageUploader
end
