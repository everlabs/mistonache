class AddAdminUserIdToAnnouncements < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :admin_user_id, :integer
  end
end
