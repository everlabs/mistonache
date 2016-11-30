class AddTitleToNovelties < ActiveRecord::Migration[5.0]
  def change
    add_column :novelties, :title, :string
  end
end
