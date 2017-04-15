ActiveAdmin.register Person do

  permit_params :name, :description, :photo, :go_category_id, :kinoshot_category_id, :mat_category_id

end