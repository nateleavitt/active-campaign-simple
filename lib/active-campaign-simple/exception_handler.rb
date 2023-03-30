require 'active-campaign-simple/exceptions'

module ActiveCampaign
  class ExceptionHandler

    ERRORS = {
      '404 Not Found' => ActiveCampaign::NotFoundError,
      '422 Unprocessable Entity' => ActiveCampaign::NotFoundError
    }

    def initialize(error)
      error_class = ERRORS[error.message]
      if error_class
        raise error_class.new(error)
      else
        raise ActiveCampaign::APIError.new(error)
      end
    end

  end
end
