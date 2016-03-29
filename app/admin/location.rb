ActiveAdmin.register Location do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description, :latitude, :longitude, :image_url,
  :best_month_from, :best_month_to, :address, :phone, :activity_theme_cd, :directions,
  :url, :hours, :email, :title, :location_type, :destination_id, :country_id, theme_ids: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  form do |f|
    f.inputs # Include the default inputs
    # f.input :destination_id, as: :select, collection: Destination.all.order(:name)
    f.inputs "Themes" do # Make a panel that holds inputs for lifestyles
      f.input :themes, as: :check_boxes, collection: Theme.all # Use formtastic to output my collection of checkboxes
    end
    f.actions # Include the default actions
  end

  index do
    id_column
    column :name
    column :destination_id do |location|
      location.destination.nil? ? '' : location.destination.name
    end
    # column :latitude
    # column :longitude
    column :description
    # column :address
    column :title
    column :location_type
    column :country do |location|
      location.country.nil? ? '' : location.country.name
    end
    column :themes do |location|
      location.themes.pluck(:name).try(:join, ', ')
    end
    actions
  end

  show do
    attributes_table do
      row :themes do |location|
        location.themes.pluck(:name).try(:join, ', ')
      end
    end
    default_main_content
  end

end
