class ChargesController < ApplicationController

  protect_from_forgery except: :create

  def new
  end

  def create

    Stripe.api_key =  "sk_test_0rLkQJdnecx9SYlOgOMFBAMe"

    @amount = params[:price].to_i 


    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    if charge.paid
      @transactions = Transaction.all
      @transactions.where(buyer_id: current_user.id).each do |t|
        t.update(completed: true)
      end

      redirect_to transactions_path, notice: "Your payment was successful!"
    else
      redirect_to transactions_path, notice: "There was a problem with your payment"
    end
  end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
