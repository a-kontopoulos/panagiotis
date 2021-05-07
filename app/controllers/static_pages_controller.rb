class StaticPagesController < ApplicationController

  def index
    @message = Message.new(params[:message])
    #creates object with recipes ordered starting from the most recent
    @blogs = Blog.most_recent
  end

  def civilLaw
    @message = Message.new(params[:message])
  end

  def immigration
    @message = Message.new(params[:message])
  end

 def investInGreece
   @message = Message.new(params[:message])
 end

 def realEstate
   @message = Message.new(params[:message])
 end

 def tax
   @message = Message.new(params[:message])
 end

 def whiteCollarCrime
   @message = Message.new(params[:message])
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
