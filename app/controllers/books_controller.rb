class BooksController < ApplicationController
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
    @book = Book.find(params[:id])
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end