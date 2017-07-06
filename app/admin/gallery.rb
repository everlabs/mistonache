ActiveAdmin.register Gallery do

  permit_params :title, :description, :admin_user_id, :main_photo, :gallery_date, photo: []

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :title, label: 'Назва'
      f.input :description, label: 'Опис'
      f.input :main_photo, as: :file, label: 'Обкладинка галереї'
      div do
        '<p class="notation">Щоб додати декілька фотографій одразу - натисніть "Оберіть файли" та виділіть потрібні фотографії, зажавши клавішу "Shift", або "Ctrl"</p>'.html_safe
      end
      f.input :photo, as: :file, input_html: { multiple: true }, label: 'Фотографії галереї'
      f.input :admin_user_id, as: :select, collection: AdminUser.all.collect { |admin_user| [admin_user.name, admin_user.id] }
      f.input :gallery_date
    end
    f.actions
  end

  controller do
    def create
      @gallery = Gallery.new(permitted_params[:gallery])
      if @gallery.save
        redirect_to admin_gallery_path(@gallery), notice: 'Альбом успішно створений.'
      else
        render 'new', notice: 'На жаль, не вдалося створити альбом, спробуйте ще раз.'
      end
    end

  end

  index do
    column :id
    column 'Назва', :title
    column 'Опис', :description do |gallery|
      gallery.description.truncate(100) if gallery.description
    end
    column 'Обкладинка галереї' do |gallery|
      image_tag gallery.main_photo.url(:thumb) if gallery.main_photo
    end
    column 'Фото' do |gallery|
      ul class: 'photo-list' do
        gallery.photo.each do |photo|
          li do
            image_tag(photo.url(:thumb)) if photo.present?
          end
        end
      end
    end
    column 'Автор', :admin_user_id
    column 'Дата створення', :gallery_date
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description do |gallery|
        gallery.description.truncate(100) if gallery.description
      end
      row :main_photo do |gallery|
        image_tag gallery.main_photo.url(:thumb) if gallery.main_photo
      end
      row('Назва') { |r| r.title }
      row :photo do
        ul class: 'photo-list' do
          gallery.photo.each do |photo|
            li do
              image_tag(photo.url(:thumb)) if photo.present?
            end
          end
        end
      end
      row('Автор') { |r| link_to r.admin_user.name, admin_admin_user_path(r.admin_user_id) }
      row :gallery_date
    end
  end

end
