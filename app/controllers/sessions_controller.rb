class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :guest_login
  def guest_login
    user = User.find_by(email: 'guest@example.com')
    if user && user.valid_password?('password')
      sign_in user
      redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
    else
      redirect_to new_user_session_path, alert: 'ゲストログインに失敗しました。'
    end
  end
end
