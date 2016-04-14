class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.where(name: params[:session][:name]).last
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to root_url
      flash[:success] = 'You are now logged in.'
    else
      flash.now[:danger] = 'Wrong name or password - only admin can log in.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
