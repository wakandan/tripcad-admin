ActiveAdmin.register Distance do
  permit_params :destination_to_id, :destination_from_id, :min_duration
  form do |f|
    f.inputs
    f.inputs "Destination to & from" do
      f.input :destination_from_id, as: :select, collection: Destination.all.order(:name) # Use formtastic to output my collection of checkboxes
      f.input :destination_to_id, as: :select, collection: Destination.all.order(:name) # Use formtastic to output my collection of checkboxes
    end
    f.actions
  end

  index do
    id_column
    column :destination_from do |distance|
      distance.destination_from.name
    end
    column :destination_to do |distance|
      distance.destination_to.name
    end
    column :min_duration
    actions
  end
end
