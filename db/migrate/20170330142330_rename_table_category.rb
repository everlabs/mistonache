class RenameTableCategory < ActiveRecord::Migration[5.0]
  def change
    rename_table :person_categories, :go_categories
  end
end
