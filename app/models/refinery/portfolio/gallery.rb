module Refinery
  module Portfolio
    class Gallery < Refinery::Core::BaseModel
      translates :title, :body, :slug
      extend FriendlyId

      acts_as_indexed :fields => [:title, :body]
      acts_as_nested_set :dependent => :destroy

      friendly_id :friendly_id_source, use: :globalize

      has_many :items, :dependent => :destroy

      alias_attribute :description, :body

      validates :title, presence: true, uniqueness: true

      after_save :bulk_update_associated_items

      # If title changes tell friendly_id to regenerate slug when
      # saving record
      def should_generate_new_friendly_id?
        title_changed?
      end

      def friendly_id_source
        title
      end

      def cover_image
        items.sort_by(&:position).first if items.present?
      end

      # We reject any empty ones because we have a template sitting around
      # (Probably not the best way to do this, but it's what the project
      # we cribbed the multi-image tab from did, and it's what we're doing
      # in the interest of time.
      def images=(ids = [])
        @image_ids = ids.reject(&:empty?).map(&:to_i).uniq
      end

      # Don't upload duplicate images
      def bulk_update_associated_items
        return unless @image_ids.present?
        @image_ids.each_with_index { |image_id, position| update_position_or_create_item(image_id, position) }
        delete_removed_items
      end

      private

      def existing_image_ids
        @existing_image_ids ||= self.items.pluck(:image_id)
      end

      def update_position_or_create_item(image_id, position)
        # If that image ID already exists, update its item's position
        if existing_image_ids.include? image_id
          items.find_by_image_id(image_id).update_attribute(:position, position)
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

      def delete_removed_items
        # Array#- will find all entries existing in the first array that do not exist in
        # the second. In this case, we want to find which item id existed before but
        # does not exist in the new array of item ids, because it's these items we
        # want to delete.
        #
        # That is:
        # [1 2 3] - [1 2 4] = [3]
        removed_items = items.where(image_id: (existing_image_ids - @image_ids))
        removed_items.map(&:destroy)
      end
    end
  end
end
