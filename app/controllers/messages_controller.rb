class MessagesController < ApplicationController
   def new
     @message = Message.new(params[:message])
   end

   def create
     @message = Message.new(message_params)
     if @message.save
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
