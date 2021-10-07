class BaseController < ApplicationController
  before_action :require_login

  # ユーザーがログインをしていない場合、ログイン画面へ遷移する
  def require_login
    redirect_to :login unless logged_in?
  end

  # セッションからuser_idに紐づくユーザー情報を取得する
  def logged_in?
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
