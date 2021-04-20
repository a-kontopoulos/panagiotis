# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview
  def new_message_email
      # Set up a temporary order for the preview
      message = Message.new(name: "Joe Smith", email: "joe@gmail.com",  message: "Hello World!")

      MessageMailer.with(message: message).new_message_email
    end
end
