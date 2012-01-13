require "mongoid-textile/version"
require "active_support/concern"
require "mongoid"
require "redcloth"

module Mongoid
  module Textile
    extend ActiveSupport::Concern
    
    included do
      before_save :textile_to_html
    end
    
    def textile_to_html
      textile_fields.each do |textile_field_name|
        field_name = textile_field_name.gsub(/_formatted/, '')
        value = self.send(field_name)
        formatted_text = RedCloth.new(value.to_s).to_html
        self.send("#{textile_field_name}=", formatted_text)
      end
    end
    
    private
    
    def textile_fields
      fields.collect{ |field| field.first }.select{ |field_name| field_name =~ /\w+_formatted/ }
    end
    
    module ClassMethods
      def textlize(*fields)
        fields.each do |field_name|
          field("#{field_name}_formatted")
        end
      end
    end
  end
end
