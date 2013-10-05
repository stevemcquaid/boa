class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all

    elsif user.has_role? :scc
        can :manage, :all
        cannot :destroy, :user

    elsif user.has_role? :booth_chair
        can :read, [ChargeType, Checkout, ContactList, Diagram, Faq, Membership, Organization, OrganizationAlias,
          OrganizationCategory, Participant, Role, ShiftParticipant, ShiftType, Tool]
        can :read, Charge, :organization_id => user.participant.organizations.first.id
        can :read, Shift, :organization_id => user.participant.organizations.first.id
        can :read, User, :user_id => user.id
        cannot :update, User
        cannot :delete, User
        
    elsif user.has_role? :member
        can :read, [Checkout, ContactList, Diagram, Faq, Membership, Organization, OrganizationAlias,
          OrganizationCategory, Participant, Role, ShiftParticipant, ShiftType, Tool]
        can :read, Shift, :organization_id => user.participant.organization.id
        can :read, User, :user_id => user.id
        cannot :update, User
        cannot :delete, User
    end
  end
end
