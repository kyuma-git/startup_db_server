class CompaniesController < ApplicationController
  def index
    @search_params = company_search_params
    @companies = Company.search(@search_params)
  end

  def company_search_params
    params.fetch(:search, {}).permit(:name, :members, :country_id)
  end

  def show
  end

  def import
    Company.import(params[:file])
    redirect_to companies_path
  end
end
