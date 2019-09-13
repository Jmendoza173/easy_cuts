class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :profile ,:edit_name,:edit_age,:edit_fav,:edit_loc,:edit_cell,:security,:edit_email,:edit_pass, :update, :destroy]

    def show
        unless @logged_in_customer && @logged_in_customer == @customer
            flash[:errors] = ["You don't have permission to see this page"]
            redirect_to clogin_view_path
        end 
    end
    
    def profile
        unless @logged_in_customer && @logged_in_customer == @customer
            flash[:errors] = ["You don't have permission to see this page"]
            redirect_to clogin_view_path
        end 
    end

    def new
        @customer = Customer.new
    end
    def edit
    end
    def edit_name
    end
    def edit_age
    end
    def edit_fav
    end
    def edit_loc
    end
    def edit_cell
    end
    def security
    end
    def edit_email
    end
    def edit_pass
    end

    def create
        @customer = Customer.new(customer_params)
        
        if @customer.save
            session[:customer_id] = @customer.id
            flash[:notification] = "Welcome #{@customer.name} to EasyCuts where getting your next hairCut is made Easy"
            redirect_to @customer
        else
            flash[:errors] = @customer.errors.full_messages
            redirect_to csign_up_path
        end
    end

    def login
        customer = Customer.find_by(email: params[:email])
            if customer && customer.authenticate(params[:password])
                session[:customer_id] = customer.id
                flash[:notification] = ["Welcome back #{customer.name}"]
                redirect_to customer_path(customer.id)
            else
                flash[:notification] = ["Either your Email or Password are incorrect."]
                redirect_to clogin_view_path
            end
    end

    def update
        if @customer.update(customer_params)
            flash[:notification] = "Update Complete"
        else  
            flash[:errors] = @customer.errors.full_messages 
        end
        redirect_to profile_path
    end

    def destroy 
        @customer.destroy
        redirect_to clogin_view_path
    end

    def logout 
        session[:customer_id] = nil
        redirect_to clogin_view_path
    end

    private

    def set_customer
        @customer = Customer.find(params[:id])
    end

    def customer_params 
        params.require(:customer).permit(:name, :age, :favorite_barber, :location, :email, :password, :cell)
    end
end
