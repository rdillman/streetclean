class AuthenticationsController < ApplicationController
  # GET /authentications
  # GET /authentications.xml
  def index
    @authentications = current_user.authentications if current_user
  end
  
  def create
    auth = request.env["omniauth.auth"]
    new_auth = Authentication.create(:provider => auth['provider'], :uid => auth['uid'])
    flash[:notice] = "Authentication successfull"
    redirect_to new_user_registration_pathgi
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
  
end
