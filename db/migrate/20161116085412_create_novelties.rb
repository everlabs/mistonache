class CreateNovelties < ActiveRecord::Migration[5.0]
  def change
    create_table :novelties do |t|
      t.string :title
      t.string :source
      t.text :body

      t.timestamps
    end
  end
end
