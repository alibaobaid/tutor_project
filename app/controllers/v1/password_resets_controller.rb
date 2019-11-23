class V1::PasswordResetsController < ApplicationController
  skip_before_action :authorize_request
  before_action :set_user, only: [:edit, :update]

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_token!
      UserMailer.reset_password(user).deliver_now
      render json: :ok
    else 
      render_not_found
    end
  end

  def edit
    render json: :ok
  end

  def update
    @user.update!(password_params)
    @user.clear_password_token!
    render json: :ok
  end
  private
  
  def password_params
    params.require(:user).permit(
      :password,
      :password_confirmation
    )
  end

  def set_user
    @user = User.find_by(reset_password_token: params[:token])
    raise ResetPasswordError unless @user&.reset_password_token_expires_at && @user.reset_password_token_expires_at > Time.now
  end
end
