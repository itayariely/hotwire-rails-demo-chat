class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  def index
    @users = User.all
  end

  def show
  end
  # def new
  #   @message = @room.messages.new
  # end
  #
  # def create
  #   @message = @room.messages.create!(message_params)
  #
  #   respond_to do |format|
  #     format.turbo_stream
  #     format.html { redirect_to @room }
  #   end
  # end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # def message_params
    #   params.require(:message).permit(:content, :participant_id)
    # end
end
