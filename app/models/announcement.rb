class Announcement < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :main_image, presence: true
  validates :title, length: { in: 10..60 }
  validates :body, length: { minimum: 150 }
  validates :published_at, presence: true

  belongs_to :admin_user
  belongs_to :category

  after_initialize :set_default_published, if: :new_record?

  mount_uploader :main_image, MainImageUploader

  default_scope { order(:published_at) }

  scope :static, -> { where(static: true) }
  scope :main_feed, -> { where(main_feed: true) }
  scope :announcements_feed, -> { where(announcements_feed: true) }
  scope :go_feed, -> { where(go_feed: true) }
  scope :kinoshot_feed, -> { where(kinoshot_feed: true) }

  def to_param
    id.to_s + '-' + Russian.translit(title).parameterize
  end

  def self.get_month(year, month)
    where('extract(year from start_date) = ? and extract(month from start_date) = ?', year, month)
  end

  private

  def set_default_published
    self.published_at = Time.now
  end

end
