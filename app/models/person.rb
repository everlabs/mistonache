class Person < ApplicationRecord

  validates_presence_of :name, :photo, :description

  belongs_to :go_category
  belongs_to :kinoshot_category

  mount_uploader :photo, PersonUploader



end
