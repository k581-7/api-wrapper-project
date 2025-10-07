module Errors
  class InvalidRequest < StandardError
    def message
      'Invalid Request: Something went wrong with the parameters or endpoint.'
    end
  end

  class Unauthorized < StandardError
    def message
      'Unauthorized: Invalid or missing access token.'
    end
  end

  class ServiceUnavailable < StandardError
    def message
      'Service Unavailable: External API is down or unreachable.'
    end
  end
end
