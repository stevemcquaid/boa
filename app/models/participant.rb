class Participant < ActiveRecord::Base
  before_save :reformat_phone
  
  attr_accessible :andrewid, :has_signed_waiver, :phone_number, :has_signed_hardhat_waiver, :membership

  #keep this DAMNIT. We need it for rails to allow the param access during swipes.
  attr_accessible :card_number
  attr_accessor :card_number
  
  validates :andrewid, :presence => true, :uniqueness => true
  validates :has_signed_waiver, :acceptance => {:accept => true}
  validates_format_of :phone_number, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :message => "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true

  has_many :organizations, :through => :memberships
  has_many :shifts, :through => :shift_participants
  has_many :checkouts, dependent: :destroy
  has_many :tools, :through => :checkouts
  has_many :memberships, dependent: :destroy
  has_many :shift_participants, dependent: :destroy
  has_one  :contact_list
  belongs_to :user, dependent: :destroy

  # ILIKE is case-insensitive LIKE in Postgres
  scope :search, lambda { |term| where('andrewid ILIKE ?', "#{term}%") }
  
  def name
    cached_name
  end

  def surname
    cached_surname
  end

  def email
    cached_email
  end

  def department
    cached_department
  end

  def student_class
    cached_student_class
  end

  #error handling here does not work?
  class NotRegistered < Exception
  end

  class BoothChairLoyalty < Exception
  end

  def self.find_by_card(card_number)
    andrewid = self.get_andrewid(card_number)

    if !andrewid.nil?
      theUser = self.find_by_andrewid(andrewid)
    end

    raise NotRegistered unless !theUser.nil?

    return theUser
  end

  def formatted_phone_number
    number_to_phone(self.phone_number, area_code: true) || "N/A"
  end
  
  private
  
  def self.get_andrewid(card_number)
    andrewid = CarnegieMellonIDCard.search(card_number)

    return andrewid
  end

  def cached_name
    update_cache
    
    read_attribute(:cached_name)
  end
  
  def cached_surname
    update_cache
    
    read_attribute(:cached_surname)
  end
  
  def cached_email
    update_cache
    
    read_attribute(:cached_email)
  end
  
  def cached_department
    update_cache
    
    read_attribute(:cached_department)
  end
  
  def cached_student_class
    update_cache
    
    read_attribute(:cached_student_class)
  end
  
  def cache_updated
    update_cache
    
    read_attribute(:cache_updated)
  end
  
  def update_cache
    if read_attribute(:cache_updated).nil? || DateTime.now - 14.days > read_attribute(:cache_updated)
      ldap_reference ||= CarnegieMellonPerson.find_by_andrewid( self.andrewid )
      
      write_attribute :cached_name, Array.[](ldap_reference["cn"]).flatten.last
      write_attribute :cached_surname, ldap_reference["sn"]
      write_attribute :cached_email, ldap_reference["mail"]
      write_attribute :cached_department, ldap_reference["cmuDepartment"]
      write_attribute :cached_student_class, ldap_reference["cmuStudentClass"]
      write_attribute :cache_updated, DateTime.now

      self.save!
    end
  end
  
  def reformat_phone
    phone_number = self.phone_number.to_s
    phone_number.gsub!(/[^0-9]/,"")
    self.phone_number = phone_number
  end
end
