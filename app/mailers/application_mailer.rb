class ApplicationMailer < ActionMailer::Base
  from_address = Mail::Address.new "web@collegestar.org"
  from_address.display_name = "College STAR"
  default from: from_address.format
  layout 'mailer'
end
