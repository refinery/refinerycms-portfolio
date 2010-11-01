class ImagesPortfolioEntry < ActiveRecord::Base

  belongs_to :image
  belongs_to :portfolio_entry

  before_save do |image_portfolio_entry|
    image_portfolio_entry.position = (ImagesPortfolioEntry.maximum(:position) || -1) + 1
  end

end
