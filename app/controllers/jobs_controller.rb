class JobsController < ApplicationController
  def index
    @jobs = Job.order(updated_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      flash[:notice] = "Added job."
      redirect_to job_path(@job)
    else
      @companies = Company.all
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :company_id)
  end
end
