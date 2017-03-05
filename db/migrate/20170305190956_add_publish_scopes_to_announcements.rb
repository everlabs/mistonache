class AddPublishScopesToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :main_feed, :boolean, default: true
    add_column :announcements, :announcements_feed, :boolean, default: true
    add_column :announcements, :go_feed, :boolean
    add_column :announcements, :kinoshot_feed, :boolean
  end
end
