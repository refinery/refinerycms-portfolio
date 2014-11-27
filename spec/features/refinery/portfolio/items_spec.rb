require "spec_helper"

module Refinery
  module Portfolio
    describe "items", :type => :feature do
      refinery_login_with :refinery_user

      before do
        Refinery::Portfolio::Engine.load_seed
      end

      context "when present" do
        before(:each) do
          @image = mock_model(Refinery::Image, :id => 23, :url => 'http://gifs.gifbin.com/1236681924_snail_transformers.gif')
        end

        describe "on root level" do
          before(:each) do
            @root_item = FactoryGirl.create(:item, :gallery_id => nil, :image_id => 23)
            allow(@root_item).to receive(:image).and_return(@image)
            allow(Item).to receive(:root_items).and_return([@root_item])
          end

          it "appears" do
            visit refinery.portfolio_galleries_path
            expect(page).to have_css("#item_#{@root_item.id}")
          end
        end

        describe "in nested gallery" do
          before(:each) do
            @gallery = FactoryGirl.create(:gallery, :title => "My Gallery")
            @galleried_item = FactoryGirl.create(:item, :gallery_id => @gallery.id, :image_id => 23)
            allow_any_instance_of(Item).to receive(:image).and_return(@image)
            allow(@gallery).to receive(:items).and_return([@galleried_item])
            allow(Gallery).to receive(:find).and_return(@gallery)
          end

          it "appears" do
            visit refinery.portfolio_gallery_path(@gallery)
            expect(page).to have_css("#item_#{@galleried_item.id}")
          end
        end
      end
    end
  end
end
