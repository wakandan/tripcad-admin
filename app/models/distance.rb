class Distance < ActiveRecord::Base
  belongs_to :destination_from, :class_name => :Destination
  belongs_to :destination_to, :class_name => :Destination
end
