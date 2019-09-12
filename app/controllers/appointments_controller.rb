class AppointmentsController < ApplicationController
        before_action :set_appointment, only: [:show,:edit,:update,:destroy]
    
        def index
            @appointments = Appointment.all
        end
    
        def show
        end
    
        def new
            @appointment = Appointment.new
            @barbers = Barber.all
            @customers = Customer.all
            @services = Service.all
            @hairs = @services.select {|service| service.hair}
            @shape_ups = @services.select {|service| service.shape_up}
            @facials = @services.select {|service| service.facial}
            @facial_hairs = @services.select {|service| service.facial_hair}
            @extras = @services.select {|service| service.extra}
        end
    
        def edit
            @barbers = Barber.all
            @customers = Customer.all
            @services = Service.all
        end
    
        def create
            if !@logged_in_customer
              flash["errors"] = [ "You must be logged in to create appointment!" ]
              redirect_to log_in_customer_path
            else
                @vote = Vote.create(color_id: params[:color_id], user_id: session[:user_id])
                @appointment = Appointment.new(appointment_params)
                if @appointment.valid?
                    @appointment.save
                    flash["notification"] = "You have created an Appointment with #{@appointment.barber.name} on #{@appointment.date} #{@appointment.time}"
                    redirect_to @appointment
                else
                    flash[:errors] = @appointment.errors.full_messages
                    redirect_to new_path
                end
            end
        end

        def update
            if @appointment.update(appointment_params)
                redirect_to @appointment
            else
                flash[:errors] = @appointment.errors.full_messages
                redirect_to edit_path
            end
        end
        
        def destroy
            if @logged_in_customer && @appointment.customer == @logged_in_customer
              flash[:notification] = "Appointment has been deleted"
              redirect_to customer_path
            else
              flash[:errors] = ["You don't have permission to see that page"]
              redirect_to log_in_path, method: :get
            end
        end
    
        private
    
        def set_appointment
            @appointment = Appointment.find([:id])
        end
    
        def appointment_params
            params.require(:appointment).permit(:date, :time, :service, :customer, :barber)
        end 
end
