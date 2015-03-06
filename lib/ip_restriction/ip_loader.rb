require 'yaml'

module IpRestriction
  class IpLoader
    DEFAULT_IPS = ['127.0.0.1']

    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def load
      unless File.exists? file_path
        warn "LwIpRestriction: file #{file_path} does not exist"
        return DEFAULT_IPS
      end
      YAML.load_file(file_path)['ips']
    end
  end
end
