module Refinery
  module Portfolio
    module Admin
      module ItemsHelper

        def gallery_path_for(item)
          (gallery = item.gallery).present? ? refinery.portfolio_gallery_path(gallery) : refinery.portfolio_galleries_path
        end

        def gallery_url_for(item)
          (gallery = item.gallery).present? ? refinery.portfolio_gallery_url(gallery) : refinery.portfolio_galleries_url
        end
      end
    end
  end
end
