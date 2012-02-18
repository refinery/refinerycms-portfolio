require 'spec_helper'

module Refinery
  module Portfolio
    describe Gallery do
      describe "validations" do

        context "when valid" do
          subject { FactoryGirl.create(:gallery, :title => "Refinery CMS") }
          it { should be_valid }
          its(:errors) { should be_empty }
          its(:title) { should == "Refinery CMS" }
        end
        
        context "when invalid" do
          subject { FactoryGirl.build(:gallery, :title => nil) }
          it "should invalidate the model" do
            subject.save
            subject.should_not be_valid
            subject.should have_at_least(1).error_on(:title)
          end
        end
      end
      
      it "should implement some sort of nested set logic" do
        Gallery.new.methods.should include(:children)
      end
    end
  end
end
