class UserMailer < ApplicationMailer
  default from: "jramoscolon@yahoo.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'jramoscolon@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
  	@appname = "Graz Custom"
  	mail( :to => user.email,
  		  :subject => "Welcome to #{@appname}!")
  end

end
