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

  def create
    @company = Company.new(company_params)

    if @company.save
      flash[:notice] = "Added company."
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      flash[:notice] = "Updated company."
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).
      permit(:name, :location, :description, :website, :industry)
  end
end
