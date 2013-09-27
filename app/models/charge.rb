class Charge < ActiveRecord::Base
  attr_accessible :amount, :description, :issuing_participant_id, :receiving_participant_id, :organization_id, :charge_type_id, :charged_at

  validates :charged_at, :issuing_participant_id, :organization_id, :charge_type_id, :presence => true

  belongs_to :organization
  belongs_to :charge_type
  belongs_to :issuing_participant, :class_name => "Participant"
  belongs_to :receiving_participant, :class_name => "Participant"
  
  default_scope order('charged_at ASC')
end
