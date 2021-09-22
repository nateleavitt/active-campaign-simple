module ActiveCampaign
  class Exception

    ERRORS = {
      404 => NotFoundError
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

class ActiveCampaignAPIError < StandardError
  def initialize(error)
    ActiveCampaign.api_logger.error "ERROR: #{msg}"
    super(msg)
  end
end

class NotFoundError < ActiveCampaignAPIError; end

