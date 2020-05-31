class MessagesController < ApplicationController
  def new
    @list = current_user.lists.find(params[:list_id])
    @message = Message.new
  end

  def create
    @list = current_user.lists.find(params[:list_id])

    if @list.create_messages(message_params)
      redirect_to @list, notice: "Message sent to list!"
    else
      redirect_to @list, notice: "There was a problem."
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
