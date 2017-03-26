class Event < ApplicationRecord

  belongs_to :place

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  mount_uploader :image, EventPosterUploader
  after_initialize :set_default_time, if: :new_record?

  def self.get_month(year, month)
    where('extract(year from start_date) = ? and extract(month from start_date) = ?', year, month)
  end

  scope :by_date_of_event, -> { order("start_date ASC") }

  private
  
  def set_default_time
    self.start_date = Time.now
  end

end
