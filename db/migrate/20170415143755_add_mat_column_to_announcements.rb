class AddMatColumnToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :mat_feed, :boolean
  end
end
