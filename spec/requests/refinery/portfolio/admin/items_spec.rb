require "spec_helper"
include ActionController::RecordIdentifier

describe Refinery do
  describe "Portfolio" do
    describe "Admin" do
      describe "Items" do

        login_refinery_user

        # Note that this spec must execute before we populate data, because it depends on no pre-existing top-level images
        it "doesn't display generic I18n content, indicating a translation issue (79: https://github.com/refinery/refinerycms-portfolio/issues/79)" do
          visit refinery.portfolio_admin_galleries_path
          within "#actions" do
            click_link "View top-level images"
          end

          page.should_not have_content "i18n:"
        end


        let(:image) { mock_model(Refinery::Image, :id => 23, :url => 'http://gifs.gifbin.com/1236681924_snail_transformers.gif') }
        let(:item) { FactoryGirl.create(:item, :gallery_id => nil, :image_id => 23) } 
        let(:gallery) { FactoryGirl.create(:gallery) }
        let(:galleried_item) { FactoryGirl.create(:item, :gallery_id => gallery.id, :image_id => 23) }

        describe "items list" do
          before(:each) do
            item.stub(:image).and_return(image)
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
              # force load
              galleried_item
            end

            it "shows items" do
              visit refinery.portfolio_admin_galleries_path
              within("##{dom_id(gallery)}") do
                click_link '1 image'
              end
              page.should have_content(galleried_item.title)
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
            end

            context "Regression tests"

            before(:each) do
              FactoryGirl.create(:gallery, :title => "A title")
              visit refinery.portfolio_admin_galleries_path
            end

            it "allows adding image via gallery's grid link (issue85: https://github.com/refinery/refinerycms-portfolio/issues/85)" do
              within("#records") do
                expect {
                  click_link 'Add an image to this gallery'
                }.to_not raise_error(NoMethodError)
              end
            end

            it "populates the gallery dropdown correctly (issue76: https://github.com/refinery/refinerycms-portfolio/issues/76)" do
              within("#records") do
                click_link 'Add an image to this gallery'
              end

              within("#item_gallery_id") do
                page.should have_content("A title")
              end
            end

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
