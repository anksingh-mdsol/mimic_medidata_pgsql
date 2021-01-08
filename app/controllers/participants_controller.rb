# frozen_string_literal: true

class ParticipantsController < ApplicationController
  before_action :find_arm, only: [:index, :destroy, :new, :create]

  def index
    @participants = @arm.participants
  end

  def new
    @participant ||= @arm.participants.new
  end

  def show; end

  def update; end

  def create
    @participant = @arm.participants.new(permit_params)
    if @participant.save
      redirect_to arm_participants_path(@arm.id)
    else
      render :new
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    if @participant.destroy
      redirect_to arm_participants_path(@participant.arm_id)
    end
  end

  private

  def permit_params
    params.require(:participant).permit(:name, :age, :gender, :arm_id)
  end

  def find_arm
    @arm = Arm.find_by(id: params[:arm_id])
  end
end
