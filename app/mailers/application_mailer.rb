class ApplicationMailer < ActionMailer::Base

  default from: "admin@chronic-tacos.com"

  def confirmation(email)
    subject_line = "Chronic Conference Confirmation"
    mail :to => email, :subject => subject_line
  end

end
