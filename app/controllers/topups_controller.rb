class TopupsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @topups = Topup.all
  end

  def show
    @topup = Topup.find(params[:id])
  end

  def new
    @topup = Topup.new
  end

  def create
    @topup = Topup.new(topup_params)
    to_cent
    @topup.save
    redirect_to topup_path(@topup)
  end

private

  def topup_params
    params.require(:topup).permit(:price_cents)
  end

  def to_cent
    @topup.price_cents *= 100
    @topup.save
  end
end
