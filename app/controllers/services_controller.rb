class ServicesController < ApplicationController

    before_action :set_service, only: [:show, :edit, :update, :destroy]

    def index 
        @services = Service.all
    end 

    def new 
        @service = Service.new 
    end 

    def edit
    end 

    def create 
        @service = Service.new(service_params)
        if @service.valid?
            @service.save 
            redirect_to services_path
        else   
            flash[:errors] = @service.errors.full_messages 
            render :new 
        end
    end 

    def update 
        if @service.update(service_params)
            redirect_to services_path 
        else 
            flash[:errors] = @service.errors.full_messages 
            render :edit 
        end
    end 

    def destroy 
        @service.destroy 
        redirect_to services_path
    end

    private 
    
    def service_params 
        params.require(:service).permit(:name)
    end

    def set_service 
        @service = Service.find(params[:id])
    end
end
