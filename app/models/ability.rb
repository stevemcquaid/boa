class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all

    elsif user.has_role? :scc
      can :manage, :all
      cannot :destroy, User

    elsif user.has_role? :booth_chair
      cannot :manage, :all

      can :read, [ChargeType, Checkout, ContactList, Document, Faq, Membership, Organization, OrganizationAlias,
                  OrganizationCategory, Participant, Role, ShiftParticipant, ShiftType, Tool]
      can :read, Charge, :organization_id => user.participant.organizations.first.id
      can :read, Shift, :organization_id => user.participant.organizations.first.id
      can :read, User, :user_id => user.id
      cannot :update, User
      cannot :destroy, User

    elsif user.has_role? :member
      cannot :manage, :all

      can :read, [Checkout, ContactList, Document, Faq, Membership, OrganizationAlias,
                  OrganizationCategory, Participant, Role, ShiftParticipant, ShiftType, Tool]

      can :read, Shift do |s|
        s.organization.participants.include? (user.participant)
      end

      can :read, User, :user_id => user.id

      can :read, Organization do |o|
        o.participants.include? (user.participant)
      end
      
      cannot :update, User
      cannot :destroy, User

    end
  end
end