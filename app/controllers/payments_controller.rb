class PaymentsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@user = current_user
		token = params[:stripeToken]
		# Create the charge on Stripe's servers - this will charge the user's card
		  begin
		  charge = Stripe::Charge.create(
		    :amount => @product.price, # amount in cents, again
		    :currency => "usd",
		    :source => token,
		    :description => params[:stripeEmail]
		  )
		  flash[:success] = "Payment processed successfully"
		  if charge.paid
		  	Order.create(
		  		:user => @user,
		  		:product => @product,
		  		:total => @product.price
		  		)
		  end

		  rescue Stripe::CardError => e
		    # The card has been declined
		    body = e.json_body
		    err = body[:error]
		    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
		  end
		  # redirect_to product_path(product)
	end
end
