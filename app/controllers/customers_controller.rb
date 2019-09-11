class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :edit, :update, :destroy]

    def show
        unless @logged_in_customer && @logged_in_customer == @customer
            flash[:errors] = ["You don't have permission to see this page"]
            redirect_to new_login_path
        end 
    end

    def new
        @customer = Customer.new
    end

    def edit
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.valid?
            session[:customer_id] = @customer.id
            redirect_to @customer
        else
            flash[:errors] = @customer.errors.full_messages
            redirect_to log_in_path
        end
    end

    def update
        if @customer.update(customer_params)
            redirect_to @customer
        else  
            flash[:errors] = @customer.errors.full_messages 
            redirect_to edit_path
        end
    end

    def destroy 
        @customer.destroy
        redirect_to log_in_path
    end

    private

    def set_customer
        @customer = Customer.find(params[:id])
    end

    def customer_params 
        params.require(:customer).permit(:name, :age, :favorite_barber, :location, :email, :password, :password_confirmation, :cell)
    end
end
