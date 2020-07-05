class BooksController < ApplicationController
  def index
  end

  def create
  	# binding.pry
  	# book.newのためのcreate記述
  	book = Book.new(book_params)
  	book.user_id = current_user.id
	book.save
	# showができていないので
	redirect_to book_path(book.id)
	# booknewここまで

  end
  def show
  end

  def edit
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end