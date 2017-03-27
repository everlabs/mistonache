class Place < ApplicationRecord
  has_many :event

  scope :by_name, -> { order("name ASC") }
end
