ActiveAdmin.register Event do

  permit_params :title, :description, :start_date, :image, :place_id

  controller do
    def new
      @event = Event.new
    end
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file
      f.input :title
      f.input :description, as: :ckeditor
      f.input :place
      f.input :start_date, as: :datetime_select
    end
    f.actions
  end

  index do
    column :id
    column 'Зображення', :image do |event|
      image_tag event.image.url(:thumb)
    end
    column 'Заголовок', :title
    column 'Місце', :place
    column 'Текст', :description do |event|
      truncate(event.description, length: 300, escape: false)
    end
    column 'Дата початку', :start_date
    actions
  end

  show do
    attributes_table do
      row :id
      row 'Зображення', :image do |event|
        image_tag event.image.url(:thumb)
      end
      row 'Заголовок', :title
      row 'Місце', :place
      row 'Текст', :description
      row 'Дата початку', :start_date
    end
  end

end