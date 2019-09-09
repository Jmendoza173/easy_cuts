class BarberShopsController < ApplicationController
    before_action :set_shop, only: [:show, :edit, :update, :destroy]

    def index
        @barber_shops = BarberShop.all
    end

    def show 
    end

    def new
        @barber_shop = BarberShop.new(flash[:attributes])
    end

    def edit
    end

    def create
        @barber_shop = BarberShop.new(shop_params)
        if @barber_shop.valid?
            @barber_shop.save
            redirect_to @barber_shop
        else
            flash[:errors] = @barber_shop.errors.full_messages
            flash[:attributes] = @barber_shop.attributes
            redirect_to new_path
        end
    end

    def update
        if @barber_shop.update(shop_params)
            redirect_to @barber_shop
        else  
            flash[:errors] = @barber_shop.errors.full_messages 
            render :edit 
        end
    end

    def destroy 
        if @barber_shop.barbers == 0
            @barber_shop.destroy
        end
    end

    private

    def set_shop
        @barber_shop = BarberShop.find(params[:id])
    end

    def shop_params 
        params.require(:barber_shop).permit(:name, :location)
    end
end
