class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :edit, :update, :destroy]

    def show
        @user = User.find(params[:id])
        unless @logged_in_user && @logged_in_user == @user
            flash[:errors] = ["You don't have permission to see that page"]
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
            @customer.save
            redirect_to @customer
        else
            flash[:errors] = @customer.errors.full_messages
            render :new
        end
    end

    def update
        if @customer.update(customer_params)
            redirect_to @customer
        else  
            flash[:errors] = @customer.errors.full_messages 
            render :edit 
        end
    end

    def destroy 
        @customer.destroy
    end

    private

    def set_customer
        @customer = Customer.find(params[:id])
    end

    def customer_params 
        params.require(:customer).permit(:name, :age, :favorite_barber, :location, :email, :password, :password_confirmation, :cell)
    end
end
