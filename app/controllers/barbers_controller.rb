class BarbersController < ApplicationController
    before_action :set_barber, only: [:show, :profile ,:edit_name,:edit_available,:edit_cash,:edit_card,:edit_cell,:edit_shop,:edit_specialty,:security,:edit_email,:edit_pass, :update, :destroy]

    def index
        @barber = Barber.all
    end

    def show
    end

    def new
        @barber = Barber.new
        @shops = BarberShop.all
        @services = Service.all
    end
    def edit
    end
    def edit_name
    end
    def edit_available
    end
    def edit_cash
    end
    def edit_card
    end
    def edit_cell
    end
    def edit_shop
        @shops = BarberShop.all
    end
    def edit_specialty
        @services = Service.all
    end
    def security
    end
    def edit_email
    end
    def edit_pass
    end


    def edit
        @shop = BarberShop.all
        @service = Service.all
    end

    def create
        @barber = Barber.new(barber_params)
        if @barber.save
            session[:barber_id] = @barber.id
            flash[:notification] = "Welcome #{@barber.name} to EasyCuts where managing your client is made asy"
            redirect_to @barber
        else
            flash[:errors] = @barber.errors.full_messages
            redirect_to bsign_up_path
        end
    end

    def login
        barber = Barber.find_by(email: params[:email])

            if barber && barber.authenticate(params[:password])
                session[:barber_id] = barber.id
                flash[:notification] = ["Welcome back #{barber.name}"]
                redirect_to barber_path(barber.id)
            else
                flash[:notification] = ["Either your Email or Password are incorrect."]
                redirect_to blogin_path
            end
    end

    def update
        if @barber.update(barber_params)
            flash[:notification] = "Update Complete"
        else
            flash[:errors] = @barber.errors.full_messages
        end
        redirect_to bprofile_path
    end

    def destroy
        @barber.destroy
        redirect_to blogin_view_path
    end

    def logout
        session[:barber_id] = nil
        redirect_to blogin_view_path
    end
    private

    def set_barber
        @barber = Barber.find(params[:id])
    end

    def barber_params
        params.require(:barber).permit(:name, :email, :password ,:if_available , :accept_cash, :accept_card, :cell, :barber_shop_id)
    end

    # def all_services
    #     @services = []
    #     @hairs = Service.all.select {|service| service.hair}
    #     @hairs.each {|style| @services << {id: style.id, specialty: style.hair}}
    #     @shape_ups = Service.all.select {|service| service.shape_up}
    #     @shape_ups.each {|style| @services << {id: style.id, specialty: style.shape_up}}
    #     @facials = Service.all.select {|service| service.facial}
    #     @facials.each {|style| @services << {id: style.id, specialty: style.facial}}
    #     @facial_hairs = Service.all.select {|service| service.facial_hair}
    #     @facial_hairs.each {|style| @services << {id: style.id, specialty: style.facial_hair}}
    #     @extras = Service.all.select {|service| service.extra}
    #     @extras.each {|style| @services << {id: style.id, specialty: style.extra}}
    #     @services
    # end
end
