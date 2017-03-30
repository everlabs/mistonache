class KinoshotCategory < ApplicationRecord
  has_many :people
  validates_uniqueness_of :num_of_place
end
