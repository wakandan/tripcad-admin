class Destination < ActiveRecord::Base
  has_and_belongs_to_many :themes
  has_many :best_times
  has_many :locations
  has_and_belongs_to_many :destinations
  accepts_nested_attributes_for :themes
  private
    def destination_params
      params.require(:destination).permit(:name, :description, :image_url, themes_attributes: [:id])
    end
end
