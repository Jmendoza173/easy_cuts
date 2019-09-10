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
        end
    
        def edit
            @barbers = Barber.all
            @customers = Customer.all
            @services = Service.all
        end
    
        def create
            @appointment = Appointment.new(appointment_params)
            if @appointment.valid?
                @appointment.save
                redirect_to @appointment
            else
                flash[:errors] = @appointment.errors.full_messages
                render :new
            end
        end
    
        def update
            if @appointment.update(appointment_params)
                redirect_to @appointment
            else
                flash[:errors] = @appointment.errors.full_messages
                render :edit
            end
        end
    
        def destroy
            @appointment.destroy
        end
    
        private
    
        def set_appointment
            @appointment = Appointment.find([:id])
        end
    
        def appointment_params
            params.require(:appointment).permit(:date, :time, :service, :customer, :barber)
        end 
end
