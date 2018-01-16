class ApplicationMailer < ActionMailer::Base

  default from: "sdriban@rtop.com"

  def confirmation(email)
    subject_line = "Chronic Conference Confirmation"
    mail :to => email, :subject => subject_line
  end

end
