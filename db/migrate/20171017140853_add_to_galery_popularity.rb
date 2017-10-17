class AddToGaleryPopularity < ActiveRecord::Migration[5.0]
  def up
    add_column :galleries, :popularity, :integer, default: 0
  end

  def down
    remove_column :galleries, :popularity
  end
end
