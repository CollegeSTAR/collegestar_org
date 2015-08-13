require 'mandrill'

class BaseMandrillMailer < ApplicationMailer
  default(
    from: "web@collegestar.org",
    reply_to: "web@collegestar.org"
  )

  private

  def send_mail(args = {})
    mail(to: args[:to], 
         subject: args[:subject], 
         body: args[:body], 
         content_type: args.fetch(:content_type, "text/html")
        )
  end

  def mandrill_template(args = {})
    template_name = args[:template_name]
    attributes = args.fetch(:attributes, {})
    mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end

    mandrill.templates.render(template_name, [], merge_vars)["html"]
  end
end
