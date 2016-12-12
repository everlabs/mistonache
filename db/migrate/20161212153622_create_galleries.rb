class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :photo
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
