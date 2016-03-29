class Location < ActiveRecord::Base
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :plans
  belongs_to :destination
  accepts_nested_attributes_for :themes
  private
    def location_params
      params.require(:location).permit(:activity_theme_cd,
        :address, :directions, :phone, :url, :hours, :email, :title, :location_type, themes_attributes: [:id])
    end
end
