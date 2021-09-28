require 'active-campaign-simple/exceptions'

module ActiveCampaign
  class ExceptionHandler

    ERRORS = {
      '404 Not Found' => ActiveCampaign::NotFoundError
    }

    def initialize(error)
      error_class = ERRORS[error.message]
      if error_class
        raise error_class, error
      else
        raise ActiveCampaign::StandardError(error)
      end
    end

  end
end
