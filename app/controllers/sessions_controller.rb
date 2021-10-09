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
end
