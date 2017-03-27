class Person < ApplicationRecord

  validates_presence_of :name, :person_category_id, :photo, :description

  belongs_to :person_category
  mount_uploader :photo, PersonUploader

end
