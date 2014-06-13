class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = "You win!!!!!!!!!!!!!!!!!"
      redirect_to companies_path
    else
      flash[:notice] = "Invalid input"
      render :edit
    end

  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "You win!!!!!!!!!!!!!!!!!"
      redirect_to companies_path
    else
      flash[:notice] = "Invalid input"
      render :new
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :description, :industry, :website, :location)
  end

end
