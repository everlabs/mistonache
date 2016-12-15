class AddStaticToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :static, :boolean, default: false
  end
end
