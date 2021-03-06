class AuthenticationsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(first_name: params[:first_name], last_name: params[:last_name])
    if user. != nil
      session[:user_id] = user.id
      flash[:notice] = 'You have successfully signed in'
      redirect_to bullshit_index_path
    else
      flash[:notice] = 'Email / Password combination is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:return_to] = nil
    flash[:notice] = 'You have successfully logged out'
    redirect_to sign_in_path
  end

end
