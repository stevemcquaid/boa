class Shift < ActiveRecord::Base
  before_save :set_end_time

  belongs_to :organization

  attr_accessible :ends_at, :starts_at, :required_number_of_participants, :organization_id, :shift_type_id

  has_many :participants, :through => :shift_participants
  has_many :shift_participants
  belongs_to :shift_type

  validates :organization_id, :starts_at, :ends_at, :required_number_of_participants, :presence => true

  scope :current, lambda { where("starts_at < ? and ends_at > ?", Time.zone.now, Time.zone.now ) }
  scope :upcoming, lambda { where("starts_at > ? and starts_at < ?", Time.zone.now, Time.zone.now + 2.hours ) }

  private
  def set_end_time
    et = self.ends_at
    self.ends_at = starts_at + 2.hours if et.nil? || et.blank?
  end

end