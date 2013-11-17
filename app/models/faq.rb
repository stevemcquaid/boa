class Faq < ActiveRecord::Base
  attr_accessible :answer, :question
  scope :search, lambda { |term| where('question LIKE ? OR answer LIKE ?', "%#{term}%", "%#{term}%") }

end
