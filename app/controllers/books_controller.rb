class BooksController < ApplicationController
  # ログインしていないと どの画面も表示されない　ログイン画面へのリダイレクト
  before_action :authenticate_user!, only: [:index, :create, :show, :edit, :update]
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
    @book = Book.find(params[:id])
    if current_user != @book.user
      redirect_to books_path
    end
  end

  def update
    # 注意　updateだがインスタンス変数
    @book = Book.find(params[:id])
    # @user = User.find(params[:id])
    # エラーメッセージ　サクセスメッセージ
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      flash[:notice] = "error"
      # 書き方
      render "edit"
    end
  end

  # ストロングパラメータ
  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end