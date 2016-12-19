ActiveAdmin.register Gallery do

  permit_params :title, :admin_user_id, photo: []

  form partial: 'form'

  controller do
    def create
      @gallery = Gallery.new(permitted_params[:gallery])
      @gallery.admin_user_id = current_admin_user.id
      if @gallery.save
        redirect_to admin_gallery_path(@gallery), notice: 'Альбом успішно створений.'
      else
        render 'new', notice: 'На жаль, не вдалося створити альбом, спробуйте ще раз.'
      end
    end

    def update
      photo_params = params[:gallery][:photo]
      title_params = params[:gallery][:title]
      admin_user_id_params = params[:gallery][:admin_user_id]
      @gallery = Gallery.find(params[:id])
      @gallery.title = title_params if title_params.present?
      @gallery.admin_user_id = admin_user_id_params if admin_user_id_params.present?
      if photo_params.present?
        @gallery.photo += photo_params
      elsif photo_params.nil?
        @gallery.photo
      else

      end
      if @gallery.save
        redirect_to admin_gallery_path(@gallery), notice: 'Альбом успішно оновлений.'
      else
        render 'edit', norice: 'На жаль, не вдалося оновоити альбом, спробуйте ще раз.'
      end
    end

  end

  index do
    column :id
    column 'Назва', :title
    column 'Фото' do |gallery|
      ul do
        gallery.photo.each do |photo|
          li do
            image_tag(photo.url(:medium)) if photo.present?
          end
        end
      end
    end
    column 'Автор', :admin_user_id
    column 'Дата створення', :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row('Назва') { |r| r.title }
      row :photo do
        ul do
          gallery.photo.each do |photo|
            li do
              image_tag(photo.url(:medium)) if photo.present?
            end
          end
        end
      end
      row('Автор') { |r| link_to r.admin_user.name, admin_admin_user_path(r.admin_user_id) }
    end
  end

end
