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
    
    module InstanceMethods
      def textile_to_html
        textile_fields = fields.collect{|f| f.first}.select{|f| f =~ /\w+_formatted/}
        textile_fields.each do |f|
          value = self.send(f.split(/(\w+)_formatted/).reject(&:blank?).first).nil? ? "" : self.send(f.split(/(\w+)_formatted/).reject(&:blank?).first)
          self.send "#{f}=".to_sym, RedCloth.new(value).to_html
        end
      end
    end
    
    module ClassMethods
      def textlize(*fields)
        fields.each do |f|
          field("#{f}_formatted")
        end
      end
    end
  end
end
