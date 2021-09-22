require 'active-campaign-simple/exceptions'

module ActiveCampaign
  class ExceptionHandler

    ERRORS = {
      404 => ActiveCampaign::NotFoundError
    }

    def initialize(error)
      puts "************* #{error.inspect}"
      error_class = ERRORS[error.status]
      if error_class
        raise error_class, error
      else
        raise ActiveCampaignAPIError(error)
      end
    end

  end
end
