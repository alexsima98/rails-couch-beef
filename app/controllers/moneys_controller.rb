class MoneysController < ApplicationController
skip_before_action :authenticate_user!

  def index
    @moneys = Money.all
  end

  def show
    @money = Money.find(params[:id])
  end
end
