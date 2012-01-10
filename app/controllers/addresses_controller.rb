class AddressesController < ApplicationController
  
  def edit
    
    @address = Address.find(params[:id])
      
  end
  
  def update
    
     @address = Address.find(params[:id])
     
     if @address.update_attributes(params[:address])
       flash[:success] = 'Address was successfully updated.'       
       redirect_to profiles_path  
     else
       render :action => "edit"
     end  
   
  end
  
end
