class EventCategory < ApplicationRecord
  has_many :events

  validates :name, presence: true,
            length: { in: 5..20 },
            uniqueness: true
end
