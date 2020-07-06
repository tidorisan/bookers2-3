class SessionsController < ApplicationController
	def create
		# チェックボック
		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
	end
end