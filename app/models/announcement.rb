class Announcement < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :title, length: { in: 10..20 }
  validates :body, length: { minimum: 150 }

  belongs_to :admin_user
end
