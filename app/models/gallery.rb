class Gallery < ApplicationRecord
  validates :title, presence: true,
            length: { in: 10..150 }
  validates :description, presence: true,
            length: { in: 25..1000 }
  validates :main_photo, presence: true
  validates :photo, presence: true
  validates :gallery_date, presence: true

  belongs_to :admin_user

  mount_uploaders :photo, PhotoUploader
  mount_uploader :main_photo, MainPhotoUploader

  def to_param
    "#{id}-#{Russian.translit(title).parameterize}"
  end

end
