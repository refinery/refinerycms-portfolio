module PortfolioHelper

  def portfolio_image_link(master, portfolio, image_index)
    if ::Refinery::Portfolio.multi_level?
      portfolio_image_url(master, portfolio, image_index)
    else
      portfolio_image_url(master, image_index)
    end
  end

  def link_to_portfolio_image(master, portfolio, image, index)
    link_to(image_fu(image, '96x96#c'),
            portfolio_image_link(master, portfolio, index))
  end

end
