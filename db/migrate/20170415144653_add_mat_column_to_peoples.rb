class AddMatColumnToPeoples < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :mat_category_id, :integer
  end
end
