class AddMainImageToAnnouncement < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :main_image, :string
  end
end
