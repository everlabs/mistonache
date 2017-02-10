class Event < ApplicationRecord

  belongs_to :place

  validates :image, presence: true

  def self.get_month(year, month)
    self.where('
      extract(year from start_date) = ? and extract(month from start_date) = ?
      ', year, month)
  end

  mount_uploader :image, EventPosterUploader
end
