class Destination < ActiveRecord::Base
  has_and_belongs_to_many :themes
  accepts_nested_attributes_for :themes
  private
    def destination_params
      params.require(:destination).permit(:name, :description, :image_url, themes_attributes: [:id])
    end
end
