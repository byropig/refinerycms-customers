class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :suburb
      t.string :city
      t.string :postal_code
      t.references :customer
     

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
