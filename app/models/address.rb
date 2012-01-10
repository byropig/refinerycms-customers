class Address < ActiveRecord::Base
  belongs_to :customer
  
  validates_presence_of :address_line_1, :suburb, :city, :postal_code, :customer
  
  scope :is_default, where(:default => true)
  
  def set_as_default
    self.update_attribute(:default, true)

    other_addresses = Address.where(:customer_id => self.customer_id)
    other_addresses.each do |address|
      if self.id != address.id
        address.update_attribute(:default, false)
      end
    end
  end
end
