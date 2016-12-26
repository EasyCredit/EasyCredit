class RequestsController < ApplicationController
  before_action :check_rights, only: [:new, :edit, :destroy]
  def index
    @requests = Request.all
  end

  def new
    @requests = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to @request, notice: 'Created!'
    else
      render :new
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to @request, notice: 'Updated!'
    else
      render :edit
    end
  end

  def show
    @request = Request.find(params[:id])

    if request.path != request_path(@request)
      redirect_to @request, status: :moved_permanently
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path, notice: 'Destroyed!'
  end


  private

  def request_params
    params.require(:request).permit(:status, :email, :credit_name)
  end

  def check_rights
    unless current_user&.admin? || current_user&.manager?
      render text: '403 - Forbidden.', status: '403'
    end
  end
end
