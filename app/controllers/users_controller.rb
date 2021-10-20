class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user = current_user

  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated book successfully."
    else
    render :edit
    end
  end
    private

  def user_params
    params.require(:user).permit(:name ,:profile_image, :introduction )
  end

end
