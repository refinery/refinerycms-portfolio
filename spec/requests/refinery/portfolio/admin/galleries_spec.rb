require "spec_helper"

describe Refinery do
  describe "Portfolio" do
    describe "Admin" do
      describe "Galleries" do
        login_refinery_user
        
        let (:gallery) { FactoryGirl.create(:gallery) }
        let (:nested_gallery) { FactoryGirl.create(:gallery, :parent => gallery) }

        describe "galleries list" do
          before(:each) do
            # Force load
            gallery
            nested_gallery
          end

          it "shows child items" do
            visit refinery.portfolio_admin_galleries_path
            page.should have_content(gallery.title)
            page.should have_content(nested_gallery.title)
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.portfolio_admin_galleries_path

            click_link "Add New Gallery"
          end

          context "valid data" do
            it "succeeds" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Portfolio::Gallery.count.should == 1
            end
          end

          context "invalid data" do
            it "fails" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Portfolio::Gallery.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:gallery, :title => "UniqueTitle") }

            it "fails" do
              visit refinery.portfolio_admin_galleries_path

              click_link "Add New Gallery"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Portfolio::Gallery.count.should == 1
            end
          end
        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:gallery, :title => "A title") }

          it "succeeds" do
            visit refinery.portfolio_admin_galleries_path

            within ".actions" do
              click_link "Edit this gallery"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:gallery, :title => "UniqueTitleOne") }

          it "succeeds" do
            visit refinery.portfolio_admin_galleries_path

            click_link "Remove this gallery forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Portfolio::Gallery.count.should == 0
          end
        end

      end
    end
  end
end
