class SessionsController < ApplicationController
  def new
  end

  def create
    # if there is a matching user
    @person = Person.find_by(username: params[:username])
    # and the password matches
    if @person && @person.authenticate(params[:password])
      ## log them in by setting a cookie in the browser
      ## it will send that on all future requests
      session[:user_id] = @person.id
      ## if last_action is set, redirect there, else root_path
      redirect_to root_path
    else
      ## send them back to the form, tell them to piss off
      @error = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
