class UsersController < ApplicationController
  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users.order("created_at").last) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow "#{user.name} - #{user.address}"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to "/users"
    else
      render "/users/new"
    end
    ####
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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "users/new"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :message)
  end
end
