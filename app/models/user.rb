class User < ActiveRecord::Base
    has_one :location
    
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Login is a virtual attribute for authentication by either email or username
   attr_accessor :login
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :username, 
                  :phone_number, :carrier
  
  
  #Needs to be built into a function in the controller!!!
  # def email_to_text(phone_carrier, number)
  #   @user = current_user
  #   @user.phone_number = number.to_s
  #   if phone_carrier == "Version"
  #     @user.phone_carrier<<"@vtext.com"
  #   elsif phone_carrier == "ATT"
  #     @user.phone_carrier<<"@txt.att.net" 
  #   elsif phone_carrier == "TMobile"
  #     @user.phone_carrier<<"@tmomail.net"
  #   else
  #     puts "FUCK Phone To Email"
  #   end
  #   debugger
  #   @user.save!
  # end
  
  # Functions for allowing Username or Email sign in as one thing.
  protected
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end
  
  def self.find_for_initialize_with_errors(required_attributes, attributes, error=:invalid)
    case_insensitive_keys.each { |k| attributes[k].try(:downcase!) }
    
    attributes = attributes.slice(*required_attributes)
    attributes.delete_if { |key, value| value.blank? }
    
    if attributes.size == required_attributes.size
      if attributes.has_key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
      else
        record = where(attributes).first
      end
    end
    
    unless record
      record = new
      
      required_attributes.each do |key|
        value = attributes[key]
        record.send("#{key}=", value)
        record.errors.add(key, value.present? ? error : :blank)
      end
    end
    record
  end
  
  # HTTP Authentication
  def self.find_record(login)
    where({:username => login} | { :email => login}).first
  end
  
end