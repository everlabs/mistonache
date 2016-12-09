class AddCategoryIdToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :category_id, :integer
  end
end
