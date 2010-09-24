class PortfolioEntry < ActiveRecord::Base

  validates :title, :presence => true

  # call to gems included in refinery.
  has_friendly_id :title, :use_slug => true
  acts_as_nested_set
  default_scope :order => 'lft ASC'

  has_and_belongs_to_many :images
  accepts_nested_attributes_for :images

  def images_attributes=(data)
    self.images.clear

    self.images += (0..(data.length-1)).collect { |i|
      (Image.find(data[i.to_s]['id'].to_i) rescue nil)
    }.compact
  end

  alias_attribute :content, :body

end
