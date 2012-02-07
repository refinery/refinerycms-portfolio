require 'spec_helper'

module Refinery
  module Portfolio
    describe Gallery do
      describe "validations" do

        context "when valid" do
          subject { FactoryGirl.create(:gallery, :title => "Refinery CMS", :gallery_type => "image") }
          it { should be_valid }
          its(:errors) { should be_empty }
          its(:title) { should == "Refinery CMS" }
          
          it "should have a valid gallery type" do
            ::Refinery::Portfolio::Gallery::VALID_GALLERY_TYPES.should include(subject.gallery_type)
          end
        end
        
        context "when invalid" do
          subject { FactoryGirl.build(:gallery, :title => "Refinery CMS", :gallery_type => "banana") }
          describe "gallery_type" do
            it "should invalidate the model" do
              subject.save
              subject.should_not be_valid
              subject.should have_at_least(1).error_on(:gallery_type)
            end
          end
        end
      end
      
      it "should implement some sort of nested set logic" do
        Gallery.new.methods.should include(:children)
      end
    end
  end
end
