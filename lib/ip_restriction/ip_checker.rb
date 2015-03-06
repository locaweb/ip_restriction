require 'ipaddr'

module IpRestriction
  class IpChecker
    attr_reader :ranges

    def initialize(ranges)
      @ranges = ranges
    end

    def allowed?(ip)
      ranges.any? do |range_or_ip|
        IPAddr.new(range_or_ip).include?(IPAddr.new(ip))
      end
    end
  end
end
