class UsersController < ApplicationController
	skip_before_action :authenticate_user, only: [:create]

	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user, status: :ok
		else
			render json: {error: @user.errors.full_messages}, status: :unprocessible_entity
		end
	    end
	end

	private

	def user_params
		params.permit(:email, :password, :full_name)
	end
end
