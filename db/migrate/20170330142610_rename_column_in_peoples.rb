class RenameColumnInPeoples < ActiveRecord::Migration[5.0]
  def change
    rename_column :people, :person_category_id, :go_category_id
  end
end
