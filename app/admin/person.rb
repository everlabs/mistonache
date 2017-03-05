ActiveAdmin.register Person do

  permit_params :name, :description, :photo, :category

end