class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:shibboleth]
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :id

  has_one :participant, dependent: :destroy
  
  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :name, :email  
  validates_uniqueness_of :email, :allow_blank => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid format", :allow_blank => true
  validates_presence_of :password, :on => :create 
  validates_presence_of :password_confirmation, :on => :create 
  validates_confirmation_of :password, :message => "does not match"
  validates_length_of :password, :minimum => 4, :message => "must be at least 4 characters long", :allow_blank => true
  
  scope :search, lambda { |term| where('name LIKE ? OR email LIKE ?', "#{term}%", "#{term}%") }

  
  # omniauth/shibboleth authentication
  def self.find_for_shibboleth_oauth(request, signed_in_resource=nil)
    user = User.where(:email => request.env['REMOTE_USER']).first
    unless user
      user = User.create(email: request.env['REMOTE_USER'],
                         first_name: request.env['REMOTE_USER'].split('@')[0],
                         password: Devise.friendly_token[0,20])
    end
    return user
  end 
    
end
