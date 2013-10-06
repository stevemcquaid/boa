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
        cannot :manage, :all

        can :read, [:charge_type, :checkout, :contact_list, :diagram, :faq, :membership, :organization, :organization_alias,
          :organization_category, :participant, :role, :shift_participant, :shift_type, :tool]
        can :read, :charge, :organization_id => user.participant.organization.id
        can :read, :shift, :organization_id => user.participant.organization.id
        can :read, :user, :user_id => user.id
        
    elsif user.has_role? :member
        cannot :manage, :all

        can :read, [:checkout, :contact_list, :diagram, :faq, :membership, :organization, :organization_alias,
          :organization_category, :participant, :role, :shift_participant, :shift_type, :tool]
        can :read, :shift, :organization_id => user.participant.organization.id
        can :read, :user, :user_id => user.id

    end
  end
end
