class GalleryController < ApplicationController
  def index
    @gifts=Store.all
  end
  def search
   
    @gifts=Store.find_by_sql ["Select * from stores WHERE name like? or model like? or color like? or description like?",params[:search],params[:search],params[:search],params[:search]]
  end
  def checkout
    amount=session[:amount]
    ActiveMerchant::Billing::Base.mode = :test

# Create a new credit card object
credit_card = ActiveMerchant::Billing::CreditCard.new(
  :number     => params[:credit_no],
  :month      => params[:month],
  :year       => params[:year],
  :first_name => params[:first_name],
  :last_name  => params[:last_name],
  :verification_value  => params[:verification_number]
)

if credit_card.valid?
  # Create a gateway object to the TrustCommerce service
  gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
    :login    => 'TestMerchant',
    :password => 'password'
  )

  # Authorize for $10 dollars (1000 cents)
  response = gateway.authorize(amount.to_i, credit_card)

  if response.success?
    # Capture the money
    puts "==========================================================================="
    PostmanMailer.purchased(amount).deliver
    session[:cart]=nil
    gateway.capture(amount.to_i, response.authorization)

    redirect_to :action=>:purchase_complete
  else
    raise StandardError, response.message
  end
end
end
end
