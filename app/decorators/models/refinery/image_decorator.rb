::Refinery::Image.class_eval do

  # Image deletion should trigger item deletion.
  has_many :items, :class_name => "Refinery::Portfolio::Item", :dependent => :destroy

end
