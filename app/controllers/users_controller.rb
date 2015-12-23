class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to(:action => 'show', :id => @user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    #debugger
  end


  private
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
