class CreateAnnouncementViews < ActiveRecord::Migration[5.0]
  def change
    create_table :announcement_views do |t|
      t.integer :announcement_id
      t.timestamps
    end
  end
end
