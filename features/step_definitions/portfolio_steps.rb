Given /^I have no portfolio entries$/ do
  PortfolioEntry.delete_all
end

Given /^I (only )?have a? ?portfolio entry?i?e?s? titled "?([^\"]*)"?$/ do |only, title|
  PortfolioEntry.delete_all if only

  entry = PortfolioEntry.create(:title => title)
end

Then /^I should have ([0-9]+) portfolio entries?$/ do |count|
  PortfolioEntry.count.should == count.to_i
end