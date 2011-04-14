class ApplicationController < ActionController::Base
  before_filter :authenticate
  
  
  
  
  

  private #-------------------------------------------------------HELPER METHODS 

        

  


 
      
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "ticket.cricket" && password == "winning"
    end
  end
end