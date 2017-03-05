ActiveAdmin.register Announcement do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :body, :admin_user_id, :main_image, :category_id, :static, :main_feed, :announcements_feed,
               :go_feed, :kinoshot_feed, :published_at

  controller do
    def new
      @announcement = Announcement.new
      @announcement.admin_user_id = current_admin_user.id
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :main_feed, label: 'На главной странице'
      f.input :announcements_feed, label: 'В новостях'
      f.input :go_feed, label: 'В ГО (наша команда)'
      f.input :kinoshot_feed, label: 'Киношот'
      f.input :static, label: 'Показывать в слайдере'
      f.input :category
      f.input :body, as: :ckeditor
      f.input :main_image, as: :file
      f.input :admin_user_id, as: :hidden
      f.input :published_at
    end
    f.actions
  end

 index do
   column :id
   column 'Зображення', :main_image do |announcement|
     image_tag announcement.main_image.url(:thumb)
   end
   column 'Заголовок', :title
   column 'Текст', :body do |announcement|
     truncate(announcement.body, length: 300, escape: false)
   end
   column 'Автор', :admin_user_id
   column 'Опубліковано', :published_at
   actions
 end

 # show do
 #   attributes_table do
 #     row :id
 #     row 'Заголовок', :title
 #     row :main_image do
 #     end
 #     row :admin_user_id
 #   end
 # end

end
