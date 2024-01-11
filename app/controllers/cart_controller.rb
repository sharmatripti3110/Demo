class CartController < ApplicationController
	#protect_from_forgery prepend: true, with: :exception

	def create
		@cart = Cart.new(cart_params)
		if @cart.save
			render json: @cart, status: :ok
		else
			render json: {error: @cart.errors.full_messages}, status: :unprocessible_entity
		end
	end

	def index
		@carts = Cart.all
		render json: {count: @carts.count}, status: :ok
	end

	private

	def product_params
		params.permit(:user_id, :product_id)
	end
end
