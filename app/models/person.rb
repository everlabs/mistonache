class Person < ApplicationRecord

  validates_presence_of :name, :category, :photo, :description

  mount_uploader :photo, PersonUploader

end
