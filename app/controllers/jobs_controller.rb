class JobsController < ApplicationController
  def index
    @jobs = Job.includes(:company).order(updated_at: :desc)
  end

  def show
    @job = Job.includes(:company).find(params[:id])

  end

  def new
    @job = Job.new
    @companies = Company.all
  end
end
