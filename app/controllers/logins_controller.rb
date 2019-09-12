class LoginsController < ApplicationController 

    def new
    end

    def create 
        customer = Customer.find_by(email: params[:email])
        # barber = Barber.find_by(email: params[:email])
        # if customer
            if customer && customer.authenticate(params[:password])
                session[:customer] = customer.id
                redirect_to customer_path(customer.id)
            else
                flash[:notification] = ["Either your Email or Password are incorrect."]
                redirect_to new_login_path
            end
        # elsif barber
        #     if barber && barber.authenticate(params[:password])
        #         session[:barber] = barber.id
        #         redirect_to barber_path(barber.id)
        #     else
        #         flash[:errors] = ["Either your Email or Password are incorrect."]
        #         redirect_to b_log_in_path
        #     end
        # end
    end

    def confirm
        customer = Customer.find_by(email: params[:email])
        # barber = Barber.find_by(email: params[:email])
        # if customer
            if customer && customer.authenticate(params[:password])
                session[:customer] = customer.id
                redirect_to security_path(customer)
            else
                flash[:notification] = ["Either your Email or Password are incorrect."]
                redirect_to confirmation_path
            end
        # elsif barber
        #     if barber && barber.authenticate(params[:password])
        #         session[:barber] = barber.id
        #         redirect_to barber_path(barber.id)
        #     else
        #         flash[:errors] = ["Either your Email or Password are incorrect."]
        #         redirect_to b_log_in_path
        #     end
        # end
    end

    def destroy
        if session[:customer_id] 
            session[:customer_id] = nil
            redirect_to new_login_path
        # elsif session[:barber_id]
        #     session[:barber_id]
        end
        
    end
end