require "spec_helper"

module Refinery
  module Portfolio
    module Admin
      describe "Galleries", :type => :feature do
        refinery_login_with :refinery_user

        describe "galleries list" do
          before(:each) do
            @gallery = FactoryGirl.create(:gallery)
            @nested_gallery = FactoryGirl.create(:gallery, :parent => @gallery)
          end

          it "shows child items" do
            visit refinery.portfolio_admin_galleries_path
            expect(page).to have_content(@gallery.title)
            expect(page).to have_content(@nested_gallery.title)
          end

          it "allows item creation" do
            visit refinery.portfolio_admin_galleries_path
            expect(page).to have_selector("a[href='/refinery/portfolio/items/new']")
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

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
              expect(Refinery::Portfolio::Gallery.count).to eq(1)
            end
          end

          context "invalid data" do
            it "fails" do
              click_button "Save"

              expect(page).to have_content("Title can't be blank")
              expect(Refinery::Portfolio::Gallery.count).to eq(0)
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:gallery, :title => "UniqueTitle") }

            it "fails" do
              visit refinery.portfolio_admin_galleries_path

              click_link "Add New Gallery"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              expect(page).to have_content("There were problems")
              expect(Refinery::Portfolio::Gallery.count).to eq(1)
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

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).to have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:gallery, :title => "UniqueTitleOne") }

          it "succeeds" do
            visit refinery.portfolio_admin_galleries_path

            click_link "Remove this gallery forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Portfolio::Gallery.count).to eq(0)
          end
        end

      end
    end
  end
end
