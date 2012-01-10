class Customer < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :surname, :contact_number, :email, :password, :password_confirmation #, :remember_me
         
  acts_as_indexed :fields => [:name, :surname, :contact_number, :email, :encrypted_password]

  validates :email, :presence => true, :uniqueness => true
  
  has_many :carts
  has_many :addresses
  has_many :orders
  
  def self.update_customer(id, name, surname, contact_number, email)
    logger.info("********************** params = #{name}")
    this_customer = self.find(id)
    this_customer.update_attributes(:name => name, :surname => surname, :contact_number => contact_number, :email => email)
    this_customer.save!
  end
  
  def delivery_address
    addresses.is_default.first
  end
end
