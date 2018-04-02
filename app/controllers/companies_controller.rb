class CompaniesController < ApplicationController
  
  def update
    # Need to add indices to model
    params["companies"].each do |id, data|
      company = Company.find(id)
      company.update_attributes(permit_data data)
    end 
    redirect_to root_path
  end
  
  private
  
    def permit_data data
      data.permit(:visible)
    end
    
end
