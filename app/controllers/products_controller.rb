class ProductsController < ApplicationController	

	def create
		@product = Product.new(product_params)
		if @product.save
			render json: @product, status: :ok
		else
			render json: {error: @product.errors.full_messages}, status: :unprocessible_entity
		end
	end

	def index
		@products = Product.all
		render json: @products, status: :ok
	end

	private

	def product_params
		params.permit(:title, :price, :quantity)
	end
end
