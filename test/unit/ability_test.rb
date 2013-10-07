require 'test_helper'

class AbilityTest < ActiveSupport::TestCase

  context "With a proper context, " do
    setup do
      create_context
    end

    teardown do
      remove_context
    end

    # admin tests
    should "admin can manage everything" do
      ability = Ability.new(@admin_user)
      assert ability.can?(:manage, :all)
    end

    # scc tests
    should "scc can do everything except destroy user" do
      ability = Ability.new(@scc_user)
      assert ability.can?(:manage, :carnegie_mellon_id_card)
      assert ability.can?(:manage, :carnegie_mellon_person)
      assert ability.can?(:manage, :charge)
      assert ability.can?(:manage, :charge_type)
      assert ability.can?(:manage, :checkout)
      assert ability.can?(:manage, :contact_list)
      assert ability.can?(:manage, :diagram)
      assert ability.can?(:manage, :faq)
      assert ability.can?(:manage, :membership)
      assert ability.can?(:manage, :organization)
      assert ability.can?(:manage, :organization_alias)
      assert ability.can?(:manage, :organization_category)
      assert ability.can?(:manage, :participant)
      assert ability.can?(:manage, :role)
      assert ability.can?(:manage, :shift)
      assert ability.can?(:manage, :shift_participant)
      assert ability.can?(:manage, :shift_type)
      assert ability.can?(:manage, :task)
      assert ability.can?(:manage, :task_status)
      assert ability.can?(:manage, :tool)
      assert ability.can?(:manage, :users_role)

      assert ability.can?(:create, :user)
      assert ability.can?(:update, :user)
      assert ability.can?(:read, :user)
      assert ability.cannot?(:destroy, :user)
    end

    # booth_chair tests
    should "booth chair can do some things but not other things" do
      ability = Ability.new(@booth_chair_user)
      assert ability.cannot?(:manage, :carnegie_mellon_id_card)
      assert ability.cannot?(:manage, :carnegie_mellon_person)

      assert ability.cannot?(:create, :charge)
      assert ability.cannot?(:update, :charge)
      assert ability.cannot?(:destroy, :charge)
      assert ability.can?(:read, Charge.new(:organization_id => @booth_chair_user.participant.organizations.first.id))

      assert ability.cannot?(:create, :charge_type)
      assert ability.cannot?(:update, :charge_type)
      assert ability.cannot?(:destroy, :charge_type)
      assert ability.can?(:read, :charge_type)

      assert ability.cannot?(:create, :checkout)
      assert ability.cannot?(:update, :checkout)
      assert ability.cannot?(:destroy, :checkout)
      assert ability.can?(:read, :checkout)

      assert ability.cannot?(:create, :contact_list)
      assert ability.cannot?(:update, :contact_list)
      assert ability.cannot?(:destroy, :contact_list)
      assert ability.can?(:read, :contact_list)

      assert ability.cannot?(:create, :diagram)
      assert ability.cannot?(:update, :diagram)
      assert ability.cannot?(:destroy, :diagram)
      assert ability.can?(:read, :diagram)

      assert ability.cannot?(:create, :faq)
      assert ability.cannot?(:update, :faq)
      assert ability.cannot?(:destroy, :faq)
      assert ability.can?(:read, :faq)

      assert ability.cannot?(:create, :membership)
      assert ability.cannot?(:update, :membership)
      assert ability.cannot?(:destroy, :membership)
      assert ability.can?(:read, :membership)

      assert ability.cannot?(:create, :organization)
      assert ability.cannot?(:update, :organization)
      assert ability.cannot?(:destroy, :organization)
      assert ability.can?(:read, :organization)

      assert ability.cannot?(:create, :organization_alias)
      assert ability.cannot?(:update, :organization_alias)
      assert ability.cannot?(:destroy, :organization_alias)
      assert ability.can?(:read, :organization_alias)

      assert ability.cannot?(:create, :organization_category)
      assert ability.cannot?(:update, :organization_category)
      assert ability.cannot?(:destroy, :organization_category)
      assert ability.can?(:read, :organization_category)

      assert ability.cannot?(:create, :participant)
      assert ability.cannot?(:update, :participant)
      assert ability.cannot?(:destroy, :participant)
      assert ability.can?(:read, :participant)

      assert ability.cannot?(:create, :role)
      assert ability.cannot?(:update, :role)
      assert ability.cannot?(:destroy, :role)
      assert ability.can?(:read, :role)

      assert ability.cannot?(:create, :shift)
      assert ability.cannot?(:update, :shift)
      assert ability.cannot?(:destroy, :shift)
      assert ability.can?(:read, Shift.new(:organization_id => @booth_chair_user.participant.organization.id))

      assert ability.cannot?(:create, :shift_participant)
      assert ability.cannot?(:update, :shift_participant)
      assert ability.cannot?(:destroy, :shift_participant)
      assert ability.can?(:read, :shift_participant)

      assert ability.cannot?(:create, :shift_type)
      assert ability.cannot?(:update, :shift_type)
      assert ability.cannot?(:destroy, :shift_type)
      assert ability.can?(:read, :shift_type)

      assert ability.cannot?(:manage, :task)
      assert ability.cannot?(:manage, :task_status)

      assert ability.cannot?(:create, :tool)
      assert ability.cannot?(:update, :tool)
      assert ability.cannot?(:destroy, :tool)
      assert ability.can?(:read, :tool)

      assert ability.can?(:read, User.new(:user_id => @booth_chair_user.id))
      assert ability.cannot?(:manage, :users_role)
    end

    # member tests
    should "member can do some things but not other things" do
      ability = Ability.new(@member_user)

      assert ability.cannot?(:manage, :carnegie_mellon_id_card)
      assert ability.cannot?(:manage, :carnegie_mellon_person)
      assert ability.cannot?(:manage, :charge)
      assert ability.cannot?(:manage, :charge_type)

      assert ability.cannot?(:create, :checkout)
      assert ability.cannot?(:update, :checkout)
      assert ability.cannot?(:destroy, :checkout)
      assert ability.can?(:read, :checkout)

      assert ability.cannot?(:create, :contact_list)
      assert ability.cannot?(:update, :contact_list)
      assert ability.cannot?(:destroy, :contact_list)
      assert ability.can?(:read, :contact_list)

      assert ability.cannot?(:create, :diagram)
      assert ability.cannot?(:update, :diagram)
      assert ability.cannot?(:destroy, :diagram)
      assert ability.can?(:read, :diagram)

      assert ability.cannot?(:create, :faq)
      assert ability.cannot?(:update, :faq)
      assert ability.cannot?(:destroy, :faq)
      assert ability.can?(:read, :faq)

      assert ability.cannot?(:create, :membership)
      assert ability.cannot?(:update, :membership)
      assert ability.cannot?(:destroy, :membership)
      assert ability.can?(:read, :membership)

      assert ability.cannot?(:create, :organization)
      assert ability.cannot?(:update, :organization)
      assert ability.cannot?(:destroy, :organization)
      assert ability.can?(:read, :organization)

      assert ability.cannot?(:create, :organization_alias)
      assert ability.cannot?(:update, :organization_alias)
      assert ability.cannot?(:destroy, :organization_alias)
      assert ability.can?(:read, :organization_alias)

      assert ability.cannot?(:create, :organization_category)
      assert ability.cannot?(:update, :organization_category)
      assert ability.cannot?(:destroy, :organization_category)
      assert ability.can?(:read, :organization_category)

      assert ability.cannot?(:create, :participant)
      assert ability.cannot?(:update, :participant)
      assert ability.cannot?(:destroy, :participant)
      assert ability.can?(:read, :participant)

      assert ability.cannot?(:create, :role)
      assert ability.cannot?(:update, :role)
      assert ability.cannot?(:destroy, :role)
      assert ability.can?(:read, :role)

      assert ability.cannot?(:create, :shift)
      assert ability.cannot?(:update, :shift)
      assert ability.cannot?(:destroy, :shift)
      assert ability.can?(:read, Shift.new(:organization_id => @member_user.participant.organization.id))

      assert ability.cannot?(:create, :shift_participant)
      assert ability.cannot?(:update, :shift_participant)
      assert ability.cannot?(:destroy, :shift_participant)
      assert ability.can?(:read, :shift_participant)

      assert ability.cannot?(:create, :shift_type)
      assert ability.cannot?(:update, :shift_type)
      assert ability.cannot?(:destroy, :shift_type)
      assert ability.can?(:read, :shift_type)

      assert ability.cannot?(:manage, :task)
      assert ability.cannot?(:manage, :task_status)

      assert ability.cannot?(:create, :tool)
      assert ability.cannot?(:update, :tool)
      assert ability.cannot?(:destroy, :tool)
      assert ability.can?(:read, :tool)

      assert ability.can?(:read, User.new(:user_id => @booth_chair_user.id))
      assert ability.cannot?(:manage, :users_role)
    end
  end
end
