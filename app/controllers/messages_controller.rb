class MessagesController < ApplicationController
  before_action :set_room, only: %i[ new create ]

  def index
    unless params[:tag].present?
      @messages = Message.all
    else
      @messages = Message.tagged_with(params[:tag])
      @tag = params[:tag]
    end
  end

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.create!(message_params)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @room }
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:content, :participant_id, tag_list: [])
    end
end
