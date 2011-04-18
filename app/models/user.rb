class User < ActiveRecord::Base
    has_one :location
    
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Login is a virtual attribute for authentication by either email or username
   attr_accessor :login, :username
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :username, 
                  :phone_number, :carrier
  
  # Functions for allowing Username or Email sign in as one thing.
  
  def text_address
    str = self.phone_number
    if self.carrier == "Verizon"
      str<<"@vtext.com"
    elsif self.carrier == "AT&T"
      str<<"@txt.att.net" 
    elsif self.carrier == "T-Mobile"
      str<<"@tmomail.net"
    else
      str="Fuck"
    end
  end
  
  
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