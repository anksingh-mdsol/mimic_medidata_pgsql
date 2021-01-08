class DoctorsController < ApplicationController

    def index
        @doctors = Doctor.all
      end
    
      def new
        @doctor ||= Doctor.new
      end
    
      def show; end
    
      def update; end
    
      def create
        @doctor = Doctor.new(permit_params)
        if @doctor.save
          redirect_to doctors_path
        else
          render :new
        end
      end
    
      def destroy 
        @doctor=Doctor.find(params[:id])
        if @doctor.destroy
            redirect_to doctors_path 
        end
        
      end
    
      private
    
      def permit_params
        params.require(:doctor).permit(:name, :specification)
      end

end
