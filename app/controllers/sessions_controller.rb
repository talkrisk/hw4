class SessionsController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by({ "email" => params["email"] })
    if @current_user
      if BCrypt::Password.new(@current_user["password"]) == params["password"]
        session["user_id"] = @current_user["id"]
        flash["notice"] = "Welcome."
        redirect_to "/posts"
      else
        flash["notice"] = "Nope."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
