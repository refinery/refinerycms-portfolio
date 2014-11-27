require 'spec_helper'

module Refinery
  module Portfolio
    describe Item, :type => :model do
      let(:gallery) { mock_model(Refinery::Portfolio::Gallery, :id => 1) }
      let(:image) { mock_model(Refinery::Image) }
      describe "validations" do
        subject { FactoryGirl.create(:item, :gallery_id => gallery.id, :image_id => image.id) }

        it { is_expected.to be_valid }
      end
    end
  end
end
