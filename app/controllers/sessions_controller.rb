class SessionsController < BaseController
  skip_before_action :require_login

  def new
    if logged_in?
      redirect_to :root
    else
      @form = LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = LoginForm.new(login_params)
    user = User.find_by(login_id: @form.login_id)

    if UserAuthenticateService.new(user).authenticate(@form.password)
      # ユーザー認証成功の処理
      session[:user_id] = user.id
      redirect_to :root
    else
      # ユーザー認証失敗の処理
      flash[:danger] = 'ユーザーの認証に失敗しました。'
      redirect_to action: 'new'
    end
  end

  private

  # ログインフォームのストロングパラメーター
  def login_params
    params.require(:login_form).permit(
      :login_id,
      :password
    )
  end
end
