class BooksController < ApplicationController
  def index
  end

  def create
  	book = Book.new(params[:id])
	book.save
	# showができていないので
	redirect_to users_index_path

  end
  def show
  end

  def edit
  end
end
