require "spec_helper"

module Refinery
  module Portfolio
    describe "galleries" do
      login_refinery_user

      let(:gallery) { FactoryGirl.create(:gallery, :title => "A Gallery") }
      let(:nested_gallery) { FactoryGirl.create(:gallery, :title => "Nested Gallery", :parent_id => gallery.id) }

      describe "when present" do
        before(:each) do
          # Force galleries to load
          @galleries = [gallery, nested_gallery]
        end
        # Users level
        it "should have an index page" do
          visit refinery.portfolio_galleries_path
          page.should have_content gallery.title
        end

        describe "display" do
          before(:each) do
            visit refinery.portfolio_galleries_path
          end

          subject { page }
          it { should have_content gallery.body }
          it { pending "placeholder: not implemented yet" } # should show its associated cover image
        end

        describe "when nested" do
          # Galleries level
          it "should display second levels inside the first level" do
            visit refinery.portfolio_galleries_path
            click_link gallery.title

            current_path.should == refinery.portfolio_gallery_path(gallery)
          end
          
          describe "display" do
            before(:each) do
              visit refinery.portfolio_gallery_path(gallery)
            end

            subject { page }
            it { should have_content nested_gallery.title }
            it { should have_content nested_gallery.body }
          end
        end
      end
    end
  end
end
