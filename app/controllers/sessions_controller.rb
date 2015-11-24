class SessionsController < ApplicationController

  def new
  end

  def create
    incoming_provider = request.env['omniauth.auth']['provider']
    incoming_uid = request.env['omniauth.auth']['uid']
    incoming_info = request.env['omniauth.auth']['info']
    nickname = incoming_info['nickname']

    user = User.find_by(provider: incoming_provider, uid: incoming_uid)
    if user
      # User found
      # sign them in
    else
      # User not found
      # sign them up
      user = User.create provider: incoming_provider, uid: incoming_uid, nickname: nickname
    end

    session[:user_id] = user.id
    redirect_to root_url, notice: "Howdy!"
  end

  def destroy
  end

end
