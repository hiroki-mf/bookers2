class UsersController < ApplicationController
  def index
   @users = User.all
   @user = current_user
   @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
    else
     @books =Book.all
     render :index
    end
  end
   
  def update
    @user = User.find(params[:id])
   if  @user.update(user_params)
    flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
   else
    render :edit
   end
  end
  
  def show
   @user = User.find(params[:id])
   @books = @user.books
   @book = Book.new
  end

  def edit
   @user = User.find(params[:id])
   unless @user.id == current_user.id 
    redirect_to user_path(current_user.id)
    
   end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  
end 
