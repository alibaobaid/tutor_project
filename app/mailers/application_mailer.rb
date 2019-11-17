# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'ali_amrah@jisr.net',
          bcc: 'ali.b5556789@gmail.com'
  layout 'mailer'
end
