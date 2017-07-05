class Gallery < ApplicationRecord
  validates :title, presence: true,
            length: { in: 10..25 }
  validates :description, presence: true,
            length: { in: 25..350 }
  validates :main_photo, presence: true
  validates :photo, presence: true

  belongs_to :admin_user

  mount_uploaders :photo, PhotoUploader
  mount_uploader :main_photo, MainPhotoUploader

  def to_param
    "#{id}-#{Russian.translit(title).parameterize}"
  end

end
