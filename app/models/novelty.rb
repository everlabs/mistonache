class Novelty < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :source, presence: true
  validates :url, presence: true
end
