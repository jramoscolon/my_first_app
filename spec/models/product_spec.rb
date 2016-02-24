require 'rails_helper'

describe Product do
	context "when the product has comments" do
		before do
			@product = Product.create!(:name => "race bike")
			@user = User.create!(:email => "me@me.com", :password => "12345678")
			@product.comments.create!(:rating => 1, :user => @user, :body => "Awful bike!")
			@product.comments.create!(:rating => 3, :user => @user, :body => "Nicely done")
			@product.comments.create!(:rating => 5, :user => @user, :body => "Sweeeet!")
		end

		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end
	end 

	context "is not valid" do
		before do
			@product = Product.new(:description => "Nice bike")
		end

		it "it is an invalid product" do
			expect(@product).not_to be_valid
		end
	end
end