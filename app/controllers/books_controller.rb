class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "You have created book successfully."
    else
    @books = Book.all
    @user = current_user
    render :index
    end

  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "You have updated book successfully."
    else
    @user = current_user
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "本当に消しますか？"
  end

  private
    def book_params
      params.require(:book).permit(:title, :body ,:profile_image)
    end

end