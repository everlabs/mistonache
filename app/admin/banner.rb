ActiveAdmin.register Banner, as: 'All Banners' do

  permit_params :image, :position, :url

  form do |f|
    f.inputs do
      f.input :image, as: :file
      div do
        '<ul class="notation"><li>1 - Верхній баннер</li><li>2 - Нижній баннер</li><li>3 - Правий верхній баннер</li><li>4 - Баннер КіноШоту</li><li>5 - Правий нижній баннер</li></ul>'.html_safe
      end
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
      row 'Позиція', :position do |banner|
        banner.position
      end
      row 'Посилання', :url do |banner|
        link_to banner.url
      end
    end
  end

end