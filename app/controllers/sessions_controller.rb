class SessionsController < ApplicationController

  module SessionsHelper
  end

  def new
  end

  # 用户登录
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

# 用户注销
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
