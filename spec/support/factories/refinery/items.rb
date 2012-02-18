FactoryGirl.define do
  factory :item, :class => Refinery::Portfolio::Item do
    title "My image"
    caption "This is a caption."
    # TODO: How do we make this do videos, too? Polymorphic association? Or just embed code?
  end
end
