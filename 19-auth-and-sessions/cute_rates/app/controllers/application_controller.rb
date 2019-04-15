class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    user_id = session[:user_id]
    if user_id.present?
      Person.find(user_id)
    end
  end

  def authorize!
    unless current_user
      ## store the request path in the session
      # session[:last_action] = request.path?
      redirect_to login_path
    end
  end
end
