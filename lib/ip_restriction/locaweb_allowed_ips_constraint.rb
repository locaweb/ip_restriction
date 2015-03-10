module IpRestriction
  class AllowedIpsConstraint
    def matches?(request)
      checker.allowed?(request.remote_ip)
    end

    private

    def checker
      @checker ||= IpChecker.new(IpsRetriever.new.office_ips)
    end
  end
end
