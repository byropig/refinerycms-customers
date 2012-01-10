class DefaultAddedToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :default, :boolean
  end

  def self.down
    remove_column :addresses, :default
  end
end
