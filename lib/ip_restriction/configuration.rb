module IpRestriction
  module Configuration
    DEFAULT_FILE_PATH = 'config/ip_restriction.yml'

    attr_accessor :file_path

    def configure
      yield self
    end

    def file_path
      @file_path || DEFAULT_FILE_PATH
    end
  end
end
