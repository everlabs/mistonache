class AddMainPhotoToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :main_photo, :string
  end
end
