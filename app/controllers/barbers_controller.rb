class BarbersController < ApplicationController
    before_action :set_barber, only: [:show,:edit,:update,:destroy]

    def index
        @barber = Barber.all
    end

    def show
    end

    def new
        @barber = Barber.new
        @shop = BarberShop.all
        @service = Service.all
    end

    def edit
        @shop = BarberShop.all
        @service = Service.all
    end

    def create
        @barber = Barber.new(barber_params)
        if @barber.valid?
            @barber.save
            redirect_to @barber
        else
            flash[:errors] = @barber.errors.full_messages
            render :new
        end
    end

    def update
        if @barber.update(barber_params)
            redirect_to @barber
        else
            flash[:errors] = @barber.errors.full_messages
            render :edit
        end
    end

    def destroy
        @barber.destroy
    end

    private

    def set_barber
        @barber = Barber.find([:id])
    end

    def barber_params
        params.require(:customer).permit(:name, :email, :password,:if_available, :accept_cash, :accept_card, :cell, :barber_shop, :service)
    end
end
