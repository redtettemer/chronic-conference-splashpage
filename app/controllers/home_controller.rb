class HomeController < ApplicationController

  def submit
    email = params[:email].downcase
    name = params[:name]
    phone = params[:phone]
    dinner = params[:dinner]
    conference = params[:conference]
    store = params[:store]
    rsvp = Guest.find_by_email(email)

    if rsvp.present?
      render :json => {error: 'This email is already registered.'}
    else
      Guest.create(:name => name, :phone => phone, :email => email, :dinner => dinner, :conference => conference, :store => store)
      confirm(email)
      render :json => {success: true}
    end
  end


  private

  def confirm(email)
    ApplicationMailer.confirmation(email).deliver
  end

end
