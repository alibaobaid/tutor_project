# app/lib/message.rb
class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    I18n.t(:invalid_credentials)
  end

  def self.invalid_token
    I18n.t(:invalid_token)
  end

  def self.missing_token
    I18n.t(:missing_token)
  end

  def self.unauthorized
    I18n.t(:unauthorized)
  end

  def self.expired_token
    I18n.t(:expired_token)
  end
end