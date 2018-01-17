class ApplicationMailer < ActionMailer::Base

  require "mandrill"

  default(
      from: "hello@example.com",
      reply_to: "hello@example.com"
  )

  def confirm(email)
    body = mandrill_template("chronic-test", nil)
    send_mail(email, body)
  end

  private

  def self.send_mail(email, body)
    mail(to: email, body: body, content_type: "text/html", subject: 'subject')
  end

  def self.mandrill_template(template_name, attributes)
    mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end

    mandrill.templates.render(template_name, [], merge_vars)["html"]
  end

end
