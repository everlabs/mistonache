ActiveAdmin.register Banner, :as => 'All Banners' do

  permit_params :image, :position, :url

  controller do
    def new
      @banner = Banner.new
    end
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file
      f.input :position
      f.input :url
    end
    f.actions
  end

  index do
    column :id
    column 'Зображення', :image do |banner|
      image_tag banner.image.url(:thumb)
    end
    column 'Позиція', :position
    column 'Посилання', :url
    actions
  end

  show do
    attributes_table do
      row :id
      row 'Зображення', :image do |banner|
        image_tag banner.image.url(:thumb)
      end
      row 'Позиція', :position
      row 'Посилання', :url
    end
  end

end