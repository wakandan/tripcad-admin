ActiveAdmin.register Destination do
  permit_params :name, :description, :image_url, theme_ids: []
  form do |f|
    f.inputs # Include the default inputs
    f.inputs "Themes" do # Make a panel that holds inputs for lifestyles
      f.input :themes, as: :check_boxes, collection: Theme.all # Use formtastic to output my collection of checkboxes
    end
    f.actions # Include the default actions
  end
  show do
    attributes_table do
      row :name
      row :description
      row :image_url
      row :themes do |destination|
        destination.themes.pluck(:name).try(:join, ', ')
      end
    end
  end
  index do
    column 'id' do |destination|
      link_to destination.id, admin_destination_path(destination)
    end
    column :name
    column :description
    column :image_url
    column :themes do |destination|
      destination.themes.pluck(:name).try(:join, ', ')
    end
  end
end
