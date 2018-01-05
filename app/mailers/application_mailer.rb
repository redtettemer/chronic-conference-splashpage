class ApplicationMailer < ActionMailer::Base

  default from: "contact@agentsofthefuture.com"

  def confirmation(email)
    subject_line = "C21 at Soho House Event Confirmation"
    attachments.inline['mail_bg.jpg'] = File.read('app/assets/images/mail_bg.jpg')
    mail :to => email, :subject => subject_line
  end

end
