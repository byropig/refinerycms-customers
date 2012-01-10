class ProfilesController < ApplicationController  
  before_filter :authenticate_customer!

  def index
    @current_customer = current_customer
    if @current_customer.present?      
      @delivery_addresses = Address.where(:customer_id => current_customer.id).all
    end
    if @current_customer.present?
      @orders = Order.where(:customer_id => current_customer.id).limit(5)      
    end  
  end
  
  def account_details  
    @current_customer = current_customer    
  end
  
  def address_details
    if current_customer.present?      
      @delivery_addresses = Address.where(:customer_id => current_customer.id).all
    end
  end
  
  def order_history
    if current_customer.present?
      @orders = Order.where(:customer_id => current_customer.id).all      
    end  
  end
  
  def order_history_details
    @current_order = Order.where(:order_number => params[:order_number]).first
  end
  
    
    
end