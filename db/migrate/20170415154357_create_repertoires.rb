class CreateRepertoires < ActiveRecord::Migration[5.0]
  def change
    create_table :repertoires do |t|
      t.string :title
      t.string :description
      t.string :first_image
      t.string :second_image

      t.timestamps
    end
  end
end
