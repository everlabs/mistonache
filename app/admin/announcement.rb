ActiveAdmin.register Announcement do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :body, :admin_user_id, :main_image, :category_id, :static, :main_feed, :announcements_feed,
               :go_feed, :kinoshot_feed, :published_at, :mat_feed

  controller do
    def new
      @announcement = Announcement.new
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :main_feed, label: 'На головній сторінці'
      f.input :announcements_feed, label: 'В новинах'
      f.input :go_feed, label: 'В ГО (наша команда)'
      f.input :kinoshot_feed, label: 'Кіношот'
      f.input :mat_feed, label: 'МАТ'
      f.input :static, label: 'Показувати в слайдері'
      f.input :category
      f.input :body, as: :ckeditor
      f.input :main_image, as: :file
      f.input :admin_user
      f.input :published_at, as: :datetime_select
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
     strip_tags(announcement.body).truncate(300)
   end
   column 'Автор', :admin_user_id
   column 'Опубліковано', :published_at
   actions
 end

end
