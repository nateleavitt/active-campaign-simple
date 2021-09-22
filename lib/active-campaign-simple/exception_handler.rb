require 'active-campaign-simple/exceptions'

module ActiveCampaign
  class ExceptionHandler

    ERRORS = {
      '404 Not Found' => ActiveCampaign::NotFoundError
    }

    def initialize(error)
      puts "************* class: #{error.class} message: #{error.message}"
      error_class = ERRORS[error.message]
      if error_class
        raise error_class, error
      else
        raise ActiveCampaignAPIError(error)
      end
    end

  end
end
