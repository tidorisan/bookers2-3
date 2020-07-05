class UsersController < ApplicationController
	def index
		@book = Book.new
		# users index
		# @users = User.all
	end

	def create
		book = Book.new(params[:id])
		book.save
		# showができていないので
		redirect_to users_index

	end

	def show
	end

	def edit

	end
end
