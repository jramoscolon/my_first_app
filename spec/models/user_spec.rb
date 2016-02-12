require 'rails_helper'

describe User do
	context "first name present" do
		before do
			@user = User.new(first_name: "John", last_name: "Smith", email: "you@me.com", password: "12345678")
		end

		it "should return first" do
			expect(@user.first_name).to eq "John"
		end
	end
end