class RemoveTitleAndBodyFromNovelty < ActiveRecord::Migration[5.0]
  def change
    remove_column :novelties, :title, :string
    remove_column :novelties, :body, :text
  end
end
