class CreditsController < ApplicationController
  before_action :check_rights, only: [:new, :edit, :destroy]
  def index
    @credits = Credit.all
  end

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(credit_params)
    @credit.user = current_user
    if @credit.save
      redirect_to @credit, notice: 'Created!'
    else
      render :new
    end
  end

  def edit
    @credit = Credit.find(params[:id])
  end

  def update
    @credit = Credit.find(params[:id])
    if @credit.update(credit_params)
      redirect_to @credit, notice: 'Updated!'
    else
      render :edit
    end
  end

  def show
    @credit = Credit.find(params[:id])

    if request.path != credit_path(@credit)
      redirect_to @credit, status: :moved_permanently
    end
  end

  def destroy
    @credit = Credit.find(params[:id])
    @credit.destroy
    redirect_to credits_path, notice: 'Destroyed!'
  end


  private

  def credit_params
    params.require(:credit).permit(:name, :description, :month_count, :credit_rate, :payment_date)
  end

  def check_rights
    unless current_user&.admin? || current_user&.manager?
      render text: '403 - Forbidden.', status: '403'
    end
  end
end
