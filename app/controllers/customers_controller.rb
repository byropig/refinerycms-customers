class CustomersController < ApplicationController

  before_filter :find_all_customers
  before_filter :find_page
  helper :all 

  
  
  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @customer in the line below:
    present(@page)
  end

  def show
    @customer = Customer.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @customer in the line below:
    present(@page)
  end

protected

  def find_all_customers
    @customers = Customer.order('surname ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/customers").first
  end

end
