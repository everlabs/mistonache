class AddGalleryDateToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :gallery_date, :date
  end
end
