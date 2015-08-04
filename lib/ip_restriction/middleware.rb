require 'singleton'

module IpRestriction
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      constraint = Constraint.instance

      if constraint.checker.allowed?(env["REMOTE_ADDR"])
        @app.call(env)
      else
        [404, {'Content-Type' => 'text/html'}, ['Not found!']]
      end
    end

    class Constraint
      include Singleton

      def checker
        @checker ||= IpRestriction::IpChecker.new(IpRestriction::IpsRetriever.new.office_ips)
      end
    end
  end
end
