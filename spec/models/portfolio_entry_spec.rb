require 'spec_helper'

Dir[File.expand_path('../../../features/support/factories.rb', __FILE__)].each {|f| require f}

describe PortfolioEntry do
  describe "validations" do
    it "rejects empty title" do
      PortfolioEntry.new.should_not be_valid
    end
  end

  describe "title_image association" do
    it "have a title_image attribute" do
      Factory(:portfolio_entry).should respond_to(:title_image)
    end
  end

  describe "images_portfolio_entries association" do
    it "have an images_portfolio_entries attribute" do
      Factory(:portfolio_entry).should respond_to(:images_portfolio_entries)
    end
  end

  describe "images association" do
    it "have an images attribute" do
      Factory(:portfolio_entry).should respond_to(:images)
    end
  end

  describe "default scope" do
    it "order by lft in ASC order" do
      PortfolioEntry.delete_all
      entry1 = Factory(:portfolio_entry)
      entry2 = Factory(:portfolio_entry)
      portfolio_entries = PortfolioEntry.all
      portfolio_entries.first.should == entry1
      portfolio_entries.second.should == entry2
    end
  end

  describe "alias between content and body" do
    it "aliases content method to body" do
      entry = Factory(:portfolio_entry, :content => "refinerycms")
      entry.content.should == entry.body
    end
  end
end
