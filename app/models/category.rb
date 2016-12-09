class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 5 }

  has_many :announcements
end
