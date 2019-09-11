class ApplicationController < ActionController::Base
    before_action :logged_in

  private

  def logged_in
    @notification = flash["notification"]
    @errors = flash["errors"]
    if session[:customer_id]
      @logged_in_user = Customer.find(session[:customer_id])
    end
  end
end
