class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  before_action :set_locale

    # return auth token once user is authenticated
  def authenticate
    auth_token = \
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    user = User.find_by(email: auth_params[:email])
    User.current = user
    data = { user: user.as_api_response(:show), auth_token: auth_token }
    json_response(
      message: I18n.t(:login),
      data: data
    )
  end

  private

  def auth_params
    params.require(:user).permit(:email, :password)
  end

  # Set request locale
  def set_locale
    I18n.locale = params[:locale] || request.headers['locale'] || I18n.default_locale
  end
end
