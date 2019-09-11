class ShopServicesController < ApplicationController

    before_action set_shop_service, only: [:edit, :update, :destroy]

    def index 
        @shop_services = ShopService.all 
    end 
    
    def new 
        @shop_service = ShopService.new 
    end

    def edit 
        @barber_shop = BarberShop.all 
        @service = Service.all 
    end 

    def create 
        @shop_service = ShopService.new(shop_service_params)
        if @shop_service.valid? 
            @shop_service.save 
            redirect_to barber_shop_path(@shop_service.barber_shop)
        else 
            flash[:errors] = @shop_service.errors.full_messages 
            render :new
        end
    end

    def update 
        if @shop_service.update(shop_service_params)
            redirect_to barber_shop_path(@shop_service.barber_shop)
        else 
            flash[:errors] = @shop_service.errors.full_messages 
            render :edit
        end
    end

    def destroy 
        @shop_service.destroy
        redirect_to barber_shop_path(@shop_service.barber_shop)
    end

    private

    def set_shop_service 
        @shop_service = Service.find(params[:id])
    end

    def shop_service_params 
        params.require(:shop_services).permit(:price, :barber_shop, :service)
    end
end
