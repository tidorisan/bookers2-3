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
		@user = User.find(params[:id])
	end

	def update
		# 注意　updateだがインスタンス変数
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
