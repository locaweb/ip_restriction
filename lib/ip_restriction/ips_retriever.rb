module IpRestriction
  class IpsRetriever
    def office_ips
      IpLoader.new(IpRestriction.file_path).load
    end
  end
end
