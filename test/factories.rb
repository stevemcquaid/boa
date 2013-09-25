FactoryGirl.define do

  # charge
  factory :charge do
    amount 100.00
    charged_at Date.today
    description "Missed 10/2 meeting"

    association :charge_type
    association :organization
    association :issuing_participant
  end

  # charge_type
  factory :charge_type do
    default_amount 100.00
    description "Missed a meeting"
    name "Meeting"
    requires_booth_chair_approval false
  end

  # checkout
  factory :checkout do
    checked_out_at Date.new
    checked_in_at nil

    association :tool
  end
  
  # membership
  factory :membership do
    booth_chair_order nil
    is_booth_chair false
    title "Head of Booth"    

    association :organization
    association :participant
  end

  # organization
  factory :organization do
    name "Kappa Alpha Theta"

    association :organization_category
  end

  # organization_alias
  factory :organization_alias do
    name "Theta"

    association :organization
  end

  # organization_category
  factory :organization_category do
    name "Blitz"
  end

  # participant
  factory :participant, :aliases => [:completed_by, :issuing_participant, :receiving_participant] do
    andrewid "rcrown"
    has_signed_hardhat_waiver true
    has_signed_waiver true
    phone_number 1234567890
  end

  # shift
  factory :shift do
    ends_at Date.new
    required_number_of_participants 3
    starts_at Date.new

    association :organization
  end

  # shift_participant
  factory :shift_participant do
    clocked_in_at Date.new

    association :participant
    association :shift
  end

  # shift_type
  factory :shift_type do
    name "Watch Shift"
  end

  # task
  factory :task do
    due_at Date.today
    name "Assign rides"

    association :task_status
    association :completed_by
  end

  # task_status
  factory :task_status do
    name "Incomplete"
  end

  # tool
  factory :tool do
    barcode 123780890
    description "HAMMER"
    name "Hammer"
  end
end
