ActiveAdmin.register Repertoire do
  permit_params :title, :description, :first_image, :second_image


form do |f|
  f.inputs do
    f.input :title
    f.input :description, as: :ckeditor
    f.input :first_image, as: :file
    f.input :second_image, as: :file

  end
  f.actions
end


end
