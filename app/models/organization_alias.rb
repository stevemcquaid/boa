class OrganizationAlias < ActiveRecord::Base
  attr_accessible :name, :organization

  validates :name, :uniqueness => true, :presence => true
  validates :organization_id, :presence => true
  validates_associated :organization

  belongs_to :organization  
  
end
