class UsersController < ApplicationController
	# ログインしているユーザのみ編集
	before_action :correct_user,   only: [:edit, :update]
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
		# defore フィルターで重複するので
		# @user = User.find(params[:id])
	end

	def update
		# 注意　updateだがインスタンス変数
		# defore フィルターで重複するので
		# @user = User.find(params[:id])
		# エラーメッセージ　サクセスメッセージ
		if @user.update(user_params)
			flash[:notice] = "successfully"
			redirect_to user_path(@user.id)
		else
			flash[:notice] = "error"
			render = edit_user_path
		end
	end

	# defore フィルター
	def correct_user
		@user = Use.find(params[:id])
		redirect_to(root_url) unless @user == current_user
		# unless @user == current_user
		# unless current_user?(@user)
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
