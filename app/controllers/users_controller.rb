class UsersController < ApplicationController
  def index
    @users = User.all
    @newbook = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      @user = User.find(params[:id])
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
