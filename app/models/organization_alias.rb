class OrganizationAlias < ActiveRecord::Base
  attr_accessible :name, :organization, :organization_id

  validates :name, :uniqueness => true, :presence => true
  validates :organization_id, :presence => true
  validates_associated :organization

  belongs_to :organization  
  
  # ILIKE is case-insensitive LIKE in Postgres
  scope :search, lambda { |term| where('name ILIKE ?', "#{term}%") }

end
