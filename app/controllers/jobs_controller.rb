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

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      flash[:notice] = "Updated job."
      redirect_to job_path(@job)
    else
      @companies = Company.all
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy

    flash[:notice] = "Job removed."
    redirect_to jobs_path
  end

  def search
    @jobs = Job.search(params[:query])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :company_id)
  end
end
