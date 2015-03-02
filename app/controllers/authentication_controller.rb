class AuthenticationController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You've logged in!"
      redirect_to root_path
    else
      flash[:notice] = "Oops, something went wrong. Try again."
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
