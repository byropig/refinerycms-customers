class DeviseCreateCustomers < ActiveRecord::Migration

  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.string :contact_number      
      
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.timestamps
    end

    add_index :customers, :id
    add_index :customers, :email,                :unique => true
    add_index :customers, :reset_password_token, :unique => true
    # add_index :customers, :confirmation_token,   :unique => true
    # add_index :customers, :unlock_token,         :unique => true
    # add_index :customers, :authentication_token, :unique => true

    load(Rails.root.join('db', 'seeds', 'customers.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "customers"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/customers"})
    end

    drop_table :customers
  end

end
