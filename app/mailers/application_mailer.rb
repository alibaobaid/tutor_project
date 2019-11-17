# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'ali_amrah@jisr.net'
          bcc: Rails.application.credentials.bcc_email
  layout 'mailer'
end
