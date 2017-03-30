class CreateKinoshotCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :kinoshot_categories do |t|
      t.string :name
      t.integer :num_of_place

      t.timestamps
    end
  end
end
