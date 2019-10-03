class BooksController < ApplicationController
  def index
  	#記事を全件習得
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
    flash[:success] = "successfully"
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
       flash[:success] = "successfully"
  	   redirect_to book_path(@book)
    else
      @books = Book.all
      render :index  #render(viewへの直接パス)
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book)
  end
  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
