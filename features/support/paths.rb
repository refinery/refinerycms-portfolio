module NavigationHelpers
  module Refinery
    module Portfolio
      def path_to(page_name)
        case page_name
        when /the list of portfolio( entries)?/
          admin_portfolio_entries_path
        when /the new portfolio( entry)? form/
          new_admin_portfolio_path
        else
          nil
        end
      end
    end
  end
end
