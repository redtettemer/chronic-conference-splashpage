class ApplicationMailer < ActionMailer::Base

  require "mandrill"

  default(
      from: "no-reply@chronictacos.com",
      reply_to: "no-reply@example.com"
  )

  def confirmation(email)
    body = mandrill_template("chronic-test")
    mail(to: email, body: body, content_type: "text/html", subject: 'subject')
  end


  private

  def mandrill_template(template_name)
    mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])
    mandrill.templates.render(template_name, [], {})["html"]
  end

end
