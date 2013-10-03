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
    
    
    # create, read, update, destroy, manage
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
