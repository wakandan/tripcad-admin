ActiveAdmin.register LocationDuration do
  form do |f|
    f.inputs # Include the default inputs
    f.inputs "Location & Durations" do
      f.input :location_from_id, as: :select, collection: Location.all.order(:name) # Use formtastic to output my collection of checkboxes
      f.input :location_to_id, as: :select, collection: Location.all.order(:name) # Use formtastic to output my collection of checkboxes
    end
    f.actions # Include the default actions
  end
end
