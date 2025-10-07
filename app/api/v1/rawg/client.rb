module V1
  module Rawg
    class Client
      def self.creator_roles
        Request.call(http_method: "get", endpoint: "/creator-roles")
      end
    end
  end
end
