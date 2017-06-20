class UsersController < ApplicationController
  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users.order("created_at").last) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    #####
    # Stripe code from https://stripe.com/docs/checkout/rails
    #####

    # Amount in cents
    @amount = 500

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
    
    #####
    # End of stripe code
    #####

    if @user.save
      redirect_to "/users"
    end
  

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :message)
  end
end
