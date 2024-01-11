class ApplicationController < ActionController::Base
	before_action :authenticate_user

	include JwtToken
	def authenticate_user
		header = request.headers["Authorization"]
		header = header.split(' ').last  if header
		begin
			@decoded = JwtToken.decode(header)
			@current_user = User.find_by(@decoded[:user_id])
		rescue ActiveRecord::RecordNotFound => e
			render json: {error: e.message}, status: :unauthorized
		rescue JWT::DecodeError => e
			render json: {error: e.message}, status: :unauthorized
		end
	end
end
