class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    response.headers.except! 'X-Frame-Options'
    @rooms = Room.all
  end

  def show
    if params[:user_id].present?
      @room.participants.find_by(participant_id:params[:user_id]).update_last_visit
    end
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.create!(room_params)
    redirect_to @room, notice: 'Room was successfully created.'
  end

  def update
    @room.update!(room_params)
    redirect_to @room, notice: 'Room was successfully updated.'
  end

  def destroy
    @room.destroy
    redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :message, messages_attributes: [:id,tag_list:[]])
    end
end
