ActiveAdmin.register Event do

  permit_params :title, :description, :start_date, :image, :place_id, :event_category_id

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
      f.input :event_category
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
    column 'Категорія', :event_category
    column 'Текст', :description do |event|
      event.description.truncate(100).html_safe
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
      row('Заголовок') { |r| r.title }
      row('Місце') { |r| r.place.name }
      row 'Опис', :description do |event|
        event.description.truncate(100).html_safe
      end
      row('Категорія') { |r| r.event_category.name if r.event_category }
      row('Дата початку') { |r| l r.start_date, format: :default }
    end
  end

end