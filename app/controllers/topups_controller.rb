class TopupsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @topups = Topup.all
  end

  def show
    @topup = Topup.find(params[:id])
  end

  def create
    @topup = Topup.new(topup_params)
  end
end
