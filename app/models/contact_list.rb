class ContactList < ActiveRecord::Base
               
   attr_accessible :participant, :display_contact

   #ENABLE THIS
   #validates :participants, :presence => true

   belongs_to :participant
   
   # scope :admins, where(:participants.user.user_role.role => Role.find_by_role("admin").id) #this requires links participant <--> user <--> user_role
   scope :contacts, where(:display_contact == true)
end
