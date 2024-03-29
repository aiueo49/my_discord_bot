class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
