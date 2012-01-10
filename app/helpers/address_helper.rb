module AddressHelper

  def address_html(address)
    if address.present?
      items = []      
      items << address.address_line_1 if address.address_line_1.present?
      items << address.address_line_2 if address.address_line_2.present?      
      items << address.suburb if address.suburb.present?      
      items << address.city if address.city.present?
      items << address.postal_code if address.postal_code.present?
            
      items.join("<br />")
    else
      nil
    end
  end

  

end
