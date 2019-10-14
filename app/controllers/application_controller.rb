class ApplicationController < ActionController::API
  include JsonResponders
  include ExceptionHandler
  include MissingData
  
  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
