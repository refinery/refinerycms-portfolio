class PortfolioEntry < ActiveRecord::Base
  
  validates_presence_of :title
  
  has_friendly_id :title, :use_slug => true, :strip_diacritics => true
  
  acts_as_tree :order => "position"
  has_and_belongs_to_many :images, :order => 'created_at DESC'

  def content
    self.body
  end
  
  def content=(value)
    self.body = value
  end
  
end