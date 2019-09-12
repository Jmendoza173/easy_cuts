class ApplicationController < ActionController::Base
    before_action :logged_in

  private

  def logged_in
    if session[:customer_id]
      @logged_in_customer = Customer.find(session[:customer_id])
    end
  end
end
