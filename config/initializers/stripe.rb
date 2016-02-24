if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		:publishable_key => 'pk_test_Zw1T0O80VnQGbj1TlB7AnpRz',
		:secret_key => 'sk_test_rgyO84e6VfzTDLltJAaN77s7'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]