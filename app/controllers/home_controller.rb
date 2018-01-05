class HomeController < ApplicationController
  def submit
    email = params[:email].downcase
    rsvp = Guest.find_by_email(email)

    if rsvp.present?
      if rsvp.attending?
        render :json => {:success => false, :msg => 'Email is already RSVP\'d'}
      else
        confirm(rsvp)
        render :json => {:success => true}
      end
    else
      rsvp = Guest.create(:first_name => params[:first], :last_name => params[:last], :email => params[:email].downcase.strip, :company_name => params[:company], :rank => 1, :attending => true)
      confirm(rsvp)
      render :json => {:success => true}
    end
  end

  private

  def confirm(rsvp)
    rsvp.update_attributes(:attending => true)
    ApplicationMailer.confirmation(rsvp.email).deliver
  end

end
