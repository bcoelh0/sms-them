class MessagesController < ApplicationController
  def new
    @list = current_user.lists.find(params[:list_id])
    @message = Message.new
  end

  def create
    @list = current_user.lists.find(params[:list_id])
    if @list.create_messages(message_params)
      render plain: "SMS sent!"
    else
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
