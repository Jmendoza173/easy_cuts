class ServicesController < ApplicationController

    before_action :set_service, only: [:show, :edit, :update, :destroy]
    before_action :set_new, only: [:new,:new_hair,:new_shape_up,:new_facial,:new_facial_hair,:new_extra]

    def index 
        @services = Service.all
        @hairs = @services.select {|service| service.hair}
        @shape_ups = @services.select {|service| service.shape_up}
        @facials = @services.select {|service| service.facial}
        @facial_hairs = @services.select {|service| service.facial_hair}
        @extras = @services.select {|service| service.extra}
    end 
    
    def new 
    end 

    def new_hair 
    end 

    def new_shape_up 
    end 

    def new_facial
    end 

    def new_facial_hair 
    end 

    def new_extra 
    end 

    def edit
    end 

    def create 
        @service = Service.new(service_params)
        if @service.hair != "nil" || @service.shape_up != "nil" || @service.facial != "nil" || @service.facial_hair != "nil" || @service.extra != "nil"
            @service.save 
            redirect_to services_path
        else   
            flash[:errors] = "You did not create anything"
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
        params.require(:service).permit(:hair,:shape_up,:facial,:facial_hair,:extra)
    end

    def set_service 
        @service = Service.find(params[:id])
    end

    def set_new 
        @service = Service.new
    end
end
