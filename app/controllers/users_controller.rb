class UsersController < ApplicationController
	def index
		# user show プロフィール画像　intoroductionなど表示
		# ログインしているユーザのものにする ここのやり方
		# @user = User.find(params[:id])
		# book new
		@book = Book.new
		# users index
	end

	def show
		@user = User.find(params[:id])
		# @user books 関係づいたもの持ってくる
		# @books = @user.books.find(params[:id])
		@books = @user.books
		@book = Book.new

	end

	def edit

	end
end
