class UsersController < ApplicationController
	def index
		# user show ログインしているユーザのみにする
		# 直接viewに書いたcurrent_user.name
		# @user = current_user
		# book new
		@book = Book.new
		# users index
		@users = User.all
	end

	def show
		# user show ログインしているユーザのみにする
		# @user = User.find(params[:id])
		# @user = current_user
		# book new
		@book = Book.new
		# book index 関連づけ
		@user = User.find(current_user.id)
		@books = @user.books



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
