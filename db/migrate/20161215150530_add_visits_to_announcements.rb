class AddVisitsToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :visits, :integer, default: 0
  end
end
