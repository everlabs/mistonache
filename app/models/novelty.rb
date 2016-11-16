class Novelty < ApplicationRecord
  validates :title, presence: true
  validates :source, presence: true
  validates :body, presence: true
end
