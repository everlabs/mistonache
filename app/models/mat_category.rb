class MatCategory < ApplicationRecord
  has_many :people
  validates_uniqueness_of :num_of_place
  validates_presence_of :name, :num_of_place
end
