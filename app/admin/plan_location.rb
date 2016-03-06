ActiveAdmin.register LocationPlan do
  form do |f|
    f.inputs # Include the default inputs
    f.inputs "Location & Plans" do
      f.input :location_id, as: :select, collection: Location.all # Use formtastic to output my collection of checkboxes
      f.input :plan_id, as: :select, collection: Plan.all # Use formtastic to output my collection of checkboxes
    end
    f.actions # Include the default actions
  end
end
