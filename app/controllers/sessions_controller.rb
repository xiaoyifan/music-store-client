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
      redirect_to root_url, notice: "Welcome back!"
    else
      user = User.create provider: incoming_provider, uid: incoming_uid, nickname: nickname
      redirect_to root_url, notice: "Thanks for registration!"
    end

    session[:user_id] = user.id
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
