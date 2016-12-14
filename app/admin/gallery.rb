ActiveAdmin.register Gallery do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :admin_user_id, photo: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

#param = {"gallery"=>{"title"=>"Перший альбом", "photo-0"=>#<ActionDispatch::Http::UploadedFile:0x0000000318fda0 @tempfile=#<Tempfile:/tmp/RackMultipart20161213-31291-l69ygl.jpg>, @original_filename="17.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"gallery[photo-0]\"; filename=\"17.jpg\"\r\nContent-Type: image/jpeg\r\n">, "photo-1"=>#<ActionDispatch::Http::UploadedFile:0x0000000318fa80 @tempfile=#<Tempfile:/tmp/RackMultipart20161213-31291-s5ekzm.jpg>, @original_filename="18.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"gallery[photo-1]\"; filename=\"18.jpg\"\r\nContent-Type: image/jpeg\r\n">, "admin_user_id"=>"1"}}
#array = []
#array << param
#gallery = array[0].select{|a| a =~ /\A(photo_)\d/}
#gallery.values

  form partial: 'form'

  controller do
    def create
      @gallery = Gallery.new(permitted_params[:gallery])
      @gallery.admin_user_id = current_admin_user.id
      if @gallery.save
        redirect_to admin_gallery_path(@gallery)
      else
        render 'new', notice: 'На жаль, не вдалося зберегти альбом, спробуйте ще раз.'
      end
    end

    def update
      @gallery = Gallery.find(params[:id])
      @gallery.photo += params[:gallery][:photo]
      @gallery.save
      redirect_to admin_gallery_path(@gallery)
    end

  end

  index do
    column :id
    column 'Назва', :title
    column 'Фото' do |gallery|
      ul do
        gallery.photo.each do |photo|
          li do
            image_tag(photo.url(:medium))
          end
        end
      end
    end
    column :admin_user_id
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :photo do
        ul do
          gallery.photo.each do |photo|
            li do
              image_tag(photo.url(:medium))
            end
          end
        end
      end
      row :admin_user_id
    end
  end

end
