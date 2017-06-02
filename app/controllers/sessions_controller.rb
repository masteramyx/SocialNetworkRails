class SessionsController < ApplicationController
  #new session --> renders login form at new.html.erb!!!!
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      #stores @user.id in a cookies, and is sent on every request
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Log in successful!"
    else
      flash.now.alert = "Invalid email or password"
      #renders log in form again w/ session#new
      render "new"
    end
  end

  def destroy
    #set user's cookie to NULL
    session[:user_id] = nil
    redirect_to root_url, notice: "Log out successful!"
  end
end
