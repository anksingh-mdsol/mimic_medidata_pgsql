class ArmsController < ApplicationController
  before_action :find_clinic, only: [:index, :destroy, :new, :create]

    def index
        @arms = @clinic.arms 
      end
    
      def new
        @arm ||= @clinic.arms.new
      end
    
      def show; end
    
      def update; end
    
      def create
        @arm = @clinic.arms.new(permit_params)
        if @arm.save
          redirect_to clinic_arms_path(@clinic.id)
        else
          render :new
        end
      end
     
      def destroy
        @arm=Arm.find(params[:id])
        redirect_to clinic_arms_path(@arm.clinic_id) if @arm.destroy
        
      end
    
      private
    
      def permit_params
        params.require(:arm).permit(:name, :limit, :clinic_id)
      end

      def find_clinic
        @clinic = Clinic.find_by(id: params[:clinic_id])
      end

end
