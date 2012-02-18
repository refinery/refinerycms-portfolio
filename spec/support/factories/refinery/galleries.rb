FactoryGirl.define do
  factory :gallery, :class => Refinery::Portfolio::Gallery do
    sequence(:title) { |n| "refinery#{n}" }
    parent_id nil
    body "This gallery is a sterling example of what a standard gallery might look like."
  end
end

