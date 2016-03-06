class Theme < ActiveRecord::Base
  has_and_belongs_to_many :locations
  
  private
    def theme_params
      params.require(:theme).permit(:name)
    end
end
