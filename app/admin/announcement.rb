ActiveAdmin.register Announcement do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :body, :admin_user_id, :main_image

  controller do
    def new
      @announcement = Announcement.new
      @announcement.admin_user_id = current_admin_user.id
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :body, as: :ckeditor
      f.input :main_image, as: :file
      f.input :admin_user_id, as: :hidden
    end
    f.actions
  end

end
