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
    book.save
    # showができていないので
    redirect_to book_path(book.id)
    # booknewここまで
  end


  def show
    # book new
    @book = Book.new
    # book show detail
    # エラーの原因
    @user = User.find(params[:id])
    # @bookで重複避ける
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end