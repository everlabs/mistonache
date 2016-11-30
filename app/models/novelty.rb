class Novelty < ApplicationRecord
  validates :title, presence: true
  validates :source, presence: true
  validates :url, presence: true
  validates :title, uniqueness: true
end
