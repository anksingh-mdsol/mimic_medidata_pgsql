# frozen_string_literal: true

class ClinicsController < ApplicationController
  def index 
    @clinics = Clinic.all
  end

  def new
    @clinic = Clinic.new
  end

  def show; end

  def update; end

  def create
    clinic = Clinic.new(permit_params)
    if clinic.save
      redirect_to clinics_path
    else
      render :new
    end
  end

  def destroy
    @clinic=Clinic.find(params[:id])
    redirect_to clinics_path if @clinic.destroy
  end

  def show_me_clinics; end

  def permit_params
    params.require(:clinic).permit(:name, :location)
  end
end
