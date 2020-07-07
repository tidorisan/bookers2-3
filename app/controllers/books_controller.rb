class BooksController < ApplicationController
  # 特定のユーザのみ編集
  before_action :correct_user,   only: [:edit, :update]
  def index
    # book new
    @book = Book.new
    # books index
    # books index user 関連づけのid)
    # 質問する
    @books = Book.all
  end

  def create
    # book.newのためのcreate記述
    book = Book.new(book_params)
    book.user_id = current_user.id
    # エラーメッセージ　サクセスメッセージ
    if book.save
      # showができていないので
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
    else
      # book new
      flash[:notice] = "error"
      redirect_to books_path
    end
  end


  def show
    # book new
    @book = Book.new
    # book show detail
    # エラーの原因
    # @bookで重複避ける
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def edit
    # before user
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
    @book = Book.find(params[:id])
    # bookに結びついた現在のユーザであるか確認
    # ここがエラーの原因らしい　undefined local variable or method `book' for #<BooksController:0x00007f62785ed2d8> Did you mean? @book
    redirect_to(root_url) unless @book == current_user
    # unless @user == current_user
    # unless current_user?(@user)
  end
  # ストロングパラメータ
  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end