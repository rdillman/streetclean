class ApplicationController < ActionController::Base
  before_filter :authenticate
  before_filter :prepare_for_mobile
  
  
  
  
  

  private #-------------------------------------------------------HELPER METHODS 

        
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent.to_s.downcase =~ /palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|webos|amoi|novarra|cdm|alcatel|pocket|ipad|iphone|mobileexplorer|mobile/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
      
  
#   protected
#   
#   def authenticate
#     authenticate_or_request_with_http_basic do |username, password|
#       username == "ticket.cricket" && password == "winning"
#     end
#   end
# end