class MessagesController < ApplicationController
   def new
     @message = Message.new(params[:message])
   end

   def create
     @message = Message.new(message_params)
     if @message.save
       MessageMailer.with(message: @message).new_message_email.deliver_later
       flash[:success] = "Thank you for your message! We'll get contact you soon!"
       @message.destroy!
      redirect_to root_path
    else
      flash.now[:error] = "Some information is missing. Please check."
      render :new
     end
   end

   private

   # Never trust parameters from the scary internet, only allow the white list through.
   def message_params
     params.require(:message).permit(
       :email,
       :name,
       :message
     )
   end

end
