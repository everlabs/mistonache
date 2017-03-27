class CreatePersonCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :person_categories do |t|
      t.string :name
      t.integer :num_of_place

      t.timestamps
    end
  end
end
