require 'spec_helper'

module Refinery
  module Portfolio
    describe Gallery, :type => :model do
      describe "validations" do

        context "when valid" do
          subject { FactoryGirl.create(:gallery, :title => "Refinery CMS") }
          it { is_expected.to be_valid }

          describe '#errors' do
            subject { super().errors }
            it { is_expected.to be_empty }
          end

          describe '#title' do
            subject { super().title }
            it { is_expected.to eq("Refinery CMS") }
          end
        end

        context "when invalid" do
          subject { FactoryGirl.build(:gallery, :title => nil) }
          it "invalidates the model" do
            subject.save
            expect(subject).not_to be_valid
            expect(subject.errors[:title].size).to be >= 1
          end
        end
      end

      it "implements some sort of nested set logic" do
        expect(Gallery.instance_methods.map(&:to_sym)).to include(:children)
      end
    end
  end
end
