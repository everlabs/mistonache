ActiveAdmin.register Gallery do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :photo, :admin_user_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form partial: 'form'

  controller do
    def new
      @gallery = Gallery.new
      @gallery.admin_user_id = current_admin_user.id
      @gallery.photo = []
    end
  end

=begin
  form do |f|
    f.inputs do
      f.input :title
      f.input :photo, as: :file
      f.input :admin_user_id, as: :hidden
    end
    f.actions
  end
=end

end
