class Location < ActiveRecord::Base
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :plans
  private
    def location_params
      params.require(:location).permit(:theme_ids)
    end
end
