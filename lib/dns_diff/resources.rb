# frozen_string_literal: true

module DnsDiff
  class Resources
    include Comparable

    attr_reader :resource_names

    def initialize(resources)
      @resource_names = resources.map do |resource|
        case resource
        when Resolv::DNS::Resource::IN::A
          resource.address.to_s
        when Resolv::DNS::Resource::IN::TXT
          resource.data
        when Resolv::DNS::Resource::IN::MX
          "#{resource.preference} #{resource.exchange.to_s}"
        else
          resource.name.to_s
        end
      end

      @resource_names.map!(&:downcase)
      @resource_names.sort!
    end

    def <=>(other)
      @resource_names <=> other.resource_names
    end
  end
end
