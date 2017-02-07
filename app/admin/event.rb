ActiveAdmin.register Event do

  permit_params :title, :description, :start_date

  controller do
    def new
      @event = Event.new
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :start_date
    end
    f.actions
  end

  index do
    column :id
    column 'Заголовок', :title
    column 'Текст', :description do |event|
      truncate(event.description, length: 300, escape: false)
    end
    column 'Дата початку', :start_date
  end

  show do
    attributes_table do
      row :id
      row 'Заголовок', :title
      row 'Текст', :description
      row 'Дата початку', :start_date
    end
  end

end