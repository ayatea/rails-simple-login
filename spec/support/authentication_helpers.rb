module AuthenticationHelpers
  # アプリケーションにログインする
  # @param [User] user ユーザーモデル
  # @param [String] password パスワード
  def login(user, password)
    post session_path, params: { login_form: { login_id: user.login_id, password: password } }
  end
end
