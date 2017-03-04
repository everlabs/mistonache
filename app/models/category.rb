class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 5 }

  has_many :announcements

  def to_param
    id.to_s + '-' + Russian.translit(name).parameterize
  end
end
