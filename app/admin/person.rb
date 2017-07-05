ActiveAdmin.register Person do

  permit_params :name, :description, :photo, :go_category_id, :kinoshot_category_id, :mat_category_id

  form do |f|
    f.inputs do
      f.input :go_category_id, as: :select, collection: GoCategory.all.collect { |category| [category.name, category.id] }
      f.input :kinoshot_category_id, as: :select, collection: KinoshotCategory.all.collect { |category| [category.name, category.id] }
      f.input :mat_category_id, as: :select, collection: MatCategory.all.collect { |category| [category.name, category.id] }
      f.input :name
      f.input :description, as: :ckeditor
      f.input :photo, as: :file
    end
    f.actions
  end

  index do
    column :id
    column :name
    column :description do |person|
      person.description.truncate(100).html_safe
    end
    column :photo do |person|
      image_tag person.photo.url(:thumb)
    end
    column :go_category_id
    column :kinoshot_category_id
    column :mat_category_id
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description do |person|
        person.description.truncate(100).html_safe
      end
      row :go_category_id
      row :kinoshot_category_id
      row :mat_category_id
      row :photo do |person|
        image_tag person.photo.url(:thumb)
      end
      row :created_at
      row :updated_at
    end
  end

end