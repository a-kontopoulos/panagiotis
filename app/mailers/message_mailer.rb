class MessageMailer < ApplicationMailer
  def new_message_email
    @message = params[:message]

    mail(to: 'a.kontopoulos@gmail.com', subject: "You have a message from a client!")
  end
end
