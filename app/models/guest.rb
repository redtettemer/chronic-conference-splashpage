class Guest < ActiveRecord::Base
  attr_accessible  :name, :phone, :email, :conference, :dinner
end