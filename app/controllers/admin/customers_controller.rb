module Admin
  class CustomersController < Admin::BaseController

    crudify :customer,
            :title_attribute => 'name', :xhr_paging => true
            
    def show
      @customer = Customer.find(params[:id])
    end        

  end
end
