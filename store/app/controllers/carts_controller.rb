class CartsController < ApplicationController

	before_action :get_cart, only:[:show, :edit, :update, :destroy]

	def show
		
	end

	def new
		@cart = Cart.new
	end

	def create
		@cart = Cart.new(cart_params)
	end

	def edit
	end

	def update
		if @cart.update_attributes(cart_params)
			redirect_to @cart
		else
			render :edit
		end		
	end

	def destroy
		
	end

	def add_cart_item
		@cart.items << Item.find(:id)
	end

	private

	def get_cart
		@cart = Cart.find(:cart_id)
	end

	def cart_params
		params.require(:cart).permit(:user_id, :total)
	end


end