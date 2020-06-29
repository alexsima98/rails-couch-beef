require 'stripe'
Stripe.api_key = Rails.configuration.stripe[:secret_key]

class OrdersController < ApplicationController
  def create
    topup = Topup.find(params[:topup_id])
    order = Order.create!(topup: topup, amount: topup.price, state: 'pending', user: current_user)

    sesiune = Stripe::Checkout::Session.create({
      success_url: order_url(order),
      cancel_url: order_url(order),
      payment_method_types: ['card'],
      line_items: [{
        name: 'Topup',
        amount: topup.price_cents,
        currency: 'eur',
        quantity: 1
      }],
    })

    order.update(checkout_session_id: sesiune.id)
    redirect_to new_order_payment_path(order)
  end

  def new
    @order = Order.new
    @topup = Topup.find(params[:topup_id])
  end

  def show
    @order = current_user.orders.find(params[:id])
    if @order.state = "paid"
      amount = current_user.wallet + @order.amount_cents / 100
      current_user.update(wallet: amount)
    end
  end
end
