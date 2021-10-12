class UserAuthenticateService
  def initialize(user)
    @user = user
  end

  # ユーザー認証処理
  # @param [String] password パスワード文字列
  # @return [Boolean] true: 認証成功、false: 認証失敗
  def authenticate(password)
    @user&.hashed_password &&
      BCrypt::Password.new(@user&.hashed_password) == password
  end
end
