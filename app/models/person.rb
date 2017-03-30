class Person < ApplicationRecord

  validates_presence_of :name, :photo, :description

  belongs_to :go_category
  belongs_to :kinoshot_category

  mount_uploader :photo, PersonUploader

  scope :kinoshot_person, -> { where("kinoshot_category_id IS NOT NULL") }
  scope :go_person, -> { where("go_category_id IS NOT NULL") }

end
