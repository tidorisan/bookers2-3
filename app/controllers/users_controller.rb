class UsersController < ApplicationController
	# home画面に行かないいのどうするのか
  	before_action :authenticate_user!, only: [:index, :show, :edit, :update]

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
		@user = User.find(params[:id])
		@books = @user.books
	end

	def edit
		# もし現在のユーザ　が　@userでなかったら
		@user = User.find(params[:id])
		if current_user != @user
			redirect_to user_path(current_user)
		end
	end

	def update
		user = User.find(params[:id])
		# @user = User.find(params[:id])
		# エラーメッセージ　サクセスメッセージ
		if user.update(user_params)
			flash[:notice] = "successfully"
			redirect_to user_path(user.id)
		else
			flash[:notice] = "error"
			@user = user
			render  "edit"
		end
	end


	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
