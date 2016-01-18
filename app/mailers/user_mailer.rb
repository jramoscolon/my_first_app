class UserMailer < ApplicationMailer
  default from: "jramoscolon@yahoo.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'jramoscolon@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end

end
