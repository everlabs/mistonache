class FixColumnNameInPersonModel < ActiveRecord::Migration[5.0]
  def change
    rename_column :people, :category, :person_category_id
  end
end
