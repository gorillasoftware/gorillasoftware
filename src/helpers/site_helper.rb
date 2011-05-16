module StaticMatic
  module Helpers
    module SiteHelper
      def slug
        return current_page.gsub(/\.html|\//,'')
      end
    end
  end
end