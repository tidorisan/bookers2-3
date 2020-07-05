class UsersController < ApplicationController
	def index
		@book = Book.new
		# users index
		@users = User.all
	end

	def show
	end

	def edit

	end
end
