class AddUrlToNovelties < ActiveRecord::Migration[5.0]
  def change
    add_column :novelties, :url, :string
  end
end
