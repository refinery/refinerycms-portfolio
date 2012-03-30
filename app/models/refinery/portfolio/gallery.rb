module Refinery
  module Portfolio
    class Gallery < Refinery::Core::BaseModel
      acts_as_indexed :fields => [:title, :body]
      acts_as_nested_set :dependent => :destroy

      extend FriendlyId
      friendly_id :title, :use => [:slugged]
      translates :title, :body

      has_many    :items, :dependent => :destroy

      attr_accessible   :title, :body, :lft, :rgt,
                        :position, :gallery_type, :depth,
                        :parent_id, :images

      alias_attribute :description, :body

      validates :title, :presence => true

      after_save :bulk_update_associated_items

      def cover_image
        items.sort_by(&:position).first if items.present?
      end

      def images
      end

      def images=(ids = [])
        @image_ids = ids.reject(&:empty?).map(&:to_i).uniq
      end


      def bulk_update_associated_items
        existing_images = ::Refinery::Portfolio::Item.select('id').where(:gallery_id => id)
        existing_ids = existing_images.collect(&:id)
        @image_ids.each_with_index do |image_id, position|
          # If image_id is in existing_ids, don't add a new one, but update its position.
          if existing_ids.include? image_id
            existing_images.find{|i| i.id == image_id }.update_attribute(:position, position)
          # If image_id is not in existing_ids, create a new one
          else
            ::Refinery::Portfolio::Item.create({
              :title => "#{title} #{position}",
              :position => position,
              :gallery_id => id,
              :image_id => image_id
            })
          end
        end
        # Once done, compare ids to existing_ids. For any missing entries in ids, delete it.
        # [1 2 3 4 5] = [ 1 2 4 5 6] = [3]
        removed_ids = existing_ids - @image_ids
        removed_ids.each do |trashed_id|
          ::Refinery::Portfolio::Item.delete(trashed_id)
        end

      end
    end
  end
end
