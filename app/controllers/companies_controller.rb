class CompaniesController < ApplicationController
  def update
    company = Company.find(params[:id])
    company.update_attributes(company_params)
    redirect_to root_path
  end

  private

    def company_params
      params.require(:company).permit(:name, :visible)
    end
end
