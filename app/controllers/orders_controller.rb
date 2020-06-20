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
        name: topup.name,
        amount: topup.price_cents,
        currency: 'eur',
        quantity: 1
      }],
    })

    order.update(checkout_session_id: sesiune.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
