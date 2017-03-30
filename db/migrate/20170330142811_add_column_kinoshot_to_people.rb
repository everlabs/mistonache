class AddColumnKinoshotToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :kinoshot_category_id, :integer
  end
end
