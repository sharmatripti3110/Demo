require 'jwt'

module JwtToken
   
   extend ActiveSupport::Concern
   SECRET_KEY = Rails.application.secrets.secret_base.to_s

	def self.encode(payload)
		JWT.encode(payload, SECRET_KEY)
	end

	def self.decode(token)
		decoded = JWT.decode(token, SECRET_KEY)[0]
	end
end