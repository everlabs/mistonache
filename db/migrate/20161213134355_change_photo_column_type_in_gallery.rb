class ChangePhotoColumnTypeInGallery < ActiveRecord::Migration[5.0]
  def change
    remove_column :galleries, :photo, :string
    add_column :galleries, :photo, :string, array: true, default: []
  end
end
