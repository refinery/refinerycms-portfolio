module Refinery
  module Portfolio
    class Gallery < Refinery::Core::Base
      
      acts_as_indexed :fields => [:title, :body]
      validates :title, :presence => true, :uniqueness => true
      attr_accessible :title, :body, :parent_id, :lft, :rgt, :position, :gallery_type, :depth

      alias_attribute :description, :body

      acts_as_nested_set :dependent => :destroy
      has_friendly_id :title, 
        :use_slug => true,
        :default_locale => (::Refinery::I18n.default_frontend_locale rescue :en),
        :approximate_ascii => ::Refinery::Portfolio.approximate_ascii,
        :strip_non_ascii => ::Refinery::Portfolio.strip_non_ascii

      has_many :items, :class_name => 'Refinery::Portfolio::Item'

      
    end
  end
end
