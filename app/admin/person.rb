ActiveAdmin.register Person do

  permit_params :name, :description, :photo, :person_category_id

end