require "spec_helper"

module Refinery
  module Portfolio
    describe "galleries" do
      refinery_login_with :refinery_user

      before do
        Refinery::Portfolio::Engine.load_seed
      end

      context "when present" do
        before(:each) do
          @gallery = FactoryGirl.create(:gallery, :title => "A Gallery")
        end

        describe "on root level" do

          # Users level
          it "appears" do
            visit refinery.portfolio_galleries_path
            page.should have_content @gallery.title
          end

          it "links to nested galleries" do
            visit refinery.portfolio_galleries_path
            click_link @gallery.title

            current_path.should == refinery.portfolio_gallery_path(@gallery)
          end
        end

        describe "in nested gallery" do
          describe "appears" do
            before(:each) do
              @nested_gallery = FactoryGirl.create(:gallery, :title => "Nested Gallery", :parent_id => @gallery.id)
              visit refinery.portfolio_gallery_path(@gallery)
            end

            subject { page }
            it { should have_content @nested_gallery.title }
            it { should have_content @nested_gallery.body }
          end
        end
      end
    end
  end
end
