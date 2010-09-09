class PortfolioEntry < ActiveRecord::Base

  validates_presence_of :title

  # call to gems included in refinery.
  has_friendly_id :title, :use_slug => true
  acts_as_nested_set
  default_scope :order => 'lft ASC'

  has_and_belongs_to_many :images

  alias_attribute :content, :body

  def image_ids=(ids)
    self.images = ids.reject{|id| id.blank?}.collect {|image_id|
      Image.find(image_id.to_i) rescue nil
    }.compact
  end

  def indented_title
    "#{"--" * self.ancestors.size} #{self.title}".chomp
  end

end
