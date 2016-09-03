class SessionsController < ActionController::Base

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    print root_path
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
