ActiveAdmin.register Image do
  actions :all, except: [:new, :create, :update, :edit]

  index do
    id_column
    column :api_key
    actions
  end

  show do
    attributes_table do
      row :api_key
      row :image do |image|
        image_tag image_preview_url(image.hashid)
      end
    end
  end
end
