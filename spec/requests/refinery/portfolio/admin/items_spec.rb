require "spec_helper"
include ActionController::RecordIdentifier

describe Refinery do
  describe "Portfolio" do
    describe "Admin" do
      describe "Items" do
        login_refinery_user

        let(:image) { mock_model(Refinery::Image, :id => 23, :url => 'http://gifs.gifbin.com/1236681924_snail_transformers.gif') }
        let(:item) { FactoryGirl.create(:item, :gallery_id => nil, :image_id => 23) } 
        let(:gallery) { FactoryGirl.create(:gallery) }

        describe "items list" do
          before(:each) do
            item.stub(:image).and_return(image)
            ::Refinery::Portfolio::Item.stub(:root_items).and_return([item])
          end

          context "no parent gallery" do
            it "shows items" do
              visit refinery.portfolio_admin_galleries_path
              within "#actions" do
                click_link "View top-level images"
              end

              page.should have_content item.title
            end
          end

          context "parent gallery" do
            before(:each) do
              gallery.stub(:items).and_return([item])
            end

            it "shows items" do
              pending "Needs implementation"
              visit refinery.portfolio_admin_galleries_path
              within("##{dom_id(gallery)}") do
                click_link 'Edit'
              end

              page.should have_content(item.title)
            end
          end
        end

        describe "create" do
          context "valid data" do
            it "succeeds" do
              pending "Needs implementation"
              visit refinery.portfolio_admin_galleries_path
              within("#actions") do
                click_link 'Add an image'
              end

              fill_in :title, :with => "My Image"
              click_link "There is currently no image selected, please click here to add one."
              save_and_open_page
            end
          end

          context "invalid data" do
            it "fails" do
            end
          end

          context "duplicate" do
            it "fails" do
            end
          end
        end

        describe "edit" do
          it "succeeds" do
          end
        end

        describe "destroy" do
          it "succeeds" do
          end
        end

      end
    end
  end
end
