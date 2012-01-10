module NavigationHelpers
  module Refinery
    module Customers
      def path_to(page_name)
        case page_name
        when /the list of customers/
          admin_customers_path

         when /the new customer form/
          new_admin_customer_path
        else
          nil
        end
      end
    end
  end
end
