class AuthenticationController < ApplicationController
	
	def login
		@user = User.find_by_email(params[:email])
		if @user.present? && @user&.authenticate(params[:password])
			token = JwtToken.encode(user_id: @user.id)
			time = Time.now + 24.hours
			render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"), name: @user.full_name }, status: :ok
		else
			render json: {error: "unauthorized" }, status: :unauthorized

		end
	end
end
