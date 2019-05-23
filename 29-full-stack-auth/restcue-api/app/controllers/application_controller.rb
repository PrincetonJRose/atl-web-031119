class ApplicationController < ActionController::API

  def current_user
    token = request.headers['Access-Token']
    return nil unless token
    payload = JWT.decode(token, ENV['MY_SECRET']).first
    User.find_by(id: payload['user_id'])
  end

  def authorize!
    unless current_user
      render json: { errors: ['You are not logged in.'] },
             status: :unauthorized
    end
  end
end
