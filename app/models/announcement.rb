class Announcement < ApplicationRecord
  validates :main_image, presence: true
  validates :title, presence: true, length: { in: 10..150 }
  validates :body, presence: true, length: { minimum: 150 }
  validates :published_at, presence: true
  validates :category_id, presence: true
  validates :admin_user_id, presence: true

  belongs_to :admin_user
  belongs_to :category

  after_initialize :set_default_published, if: :new_record?

  mount_uploader :main_image, MainImageUploader

  default_scope { order(published_at: :desc) }

  scope :static, -> { where(static: true) }
  scope :main_feed, -> { where(main_feed: true) }
  scope :announcements_feed, -> { where(announcements_feed: true) }
  scope :go_feed, -> { where(go_feed: true) }
  scope :kinoshot_feed, -> { where(kinoshot_feed: true) }
  scope :mat_feed, -> { where(mat_feed: true) }

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
