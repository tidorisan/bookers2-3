class ApplicationController < ActionController::Base
	# devise でのカラム追加
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
    	user_path(current_user.id) # ログイン後に遷移するpathを設定
  	end
  	def after_sign_out_path_for(resource)
  		root_path
  	end
  	protected
	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  	end

	# ログインしていないと どの画面も表示されない　ログイン画面へのリダイレクト
	 before_action :authenticate_user!
	 # エラー　サクセスメッセージ
	 # user name
	 validates :name, presence:  true
	 				length: { minmum:2, maximum: 8 }
	 			:introduction, length: { maximum: 50 }
	 validates :
end