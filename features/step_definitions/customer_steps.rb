Given /^I have no customers$/ do
  Customer.delete_all
end

Given /^I (only )?have customers titled "?([^\"]*)"?$/ do |only, titles|
  Customer.delete_all if only
  titles.split(', ').each do |title|
    Customer.create(:name => title)
  end
end

Then /^I should have ([0-9]+) customers?$/ do |count|
  Customer.count.should == count.to_i
end
