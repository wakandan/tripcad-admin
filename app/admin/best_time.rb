ActiveAdmin.register BestTime do
  permit_params :destination_id, :best_time, :best_date_from, :best_date_to, :description
end
