require 'spec_helper'

describe Customer do

  def reset_customer(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @customer.destroy! if @customer
    @customer = Customer.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_customer
  end

  context "validations" do
    
    it "rejects empty name" do
      Customer.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_customer
      Customer.new(@valid_attributes).should_not be_valid
    end
    
  end

end