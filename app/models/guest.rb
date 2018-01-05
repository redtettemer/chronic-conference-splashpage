class Guest < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :rank, :waitlisted, :attending, :company_name, :broker, :c21_company
end