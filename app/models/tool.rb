class Tool < ActiveRecord::Base
  attr_accessible :barcode, :description, :name, :checkouts, :participants, :organizations

  has_many :checkouts
  has_many :participants, :through => :checkouts
  has_many :organizations, :through => :checkouts

  validates :barcode, :presence => true, :uniqueness => true, :length => { :minimum => 2, :maximum => 20}
  validates :name, :presence => true
  
  scope :by_barcode, order('barcode')

  # ILIKE is case-insensitive LIKE in Postgres
  scope :hardhats, where("name ILIKE '%hardhat'")
  scope :radios, where("NAME ILIKE '%radio'")
  scope :just_tools, where("NAME NOT ILIKE '%radio' AND NAME NOT ILIKE '%hardhat'")

  scope :search, lambda { |term| where("name ILIKE ? OR CAST(barcode AS TEXT) ILIKE ?", "#{term}%", "#{term}%") }


  def current_organization
    if not self.checkouts.current.empty?
      return self.checkouts.current[0].organization
    end
  end

  def current_participant
    if not self.checkouts.current.empty?
      return self.checkouts.current[0].participant
    end
  end

  def is_checked_out?
    return not(self.checkouts.current.empty?)
  end

  def self.checked_out_by_organization(organization)
    joins(:checkouts).where(:checkouts => {:organization_id => organization }).merge(Checkout.current)
  end
end