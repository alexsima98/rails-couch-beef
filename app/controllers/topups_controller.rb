class TopupsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @topups = Topup.all
  end

  def show
    @topup = Topup.find(params[:id])
  end
end
