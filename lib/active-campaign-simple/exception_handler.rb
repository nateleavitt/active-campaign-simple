require 'active-campaign-simple/exceptions'

module ActiveCampaign
  class ExceptionHandler
    ERRORS = {
      '404 Not Found' => ActiveCampaign::NotFoundError,
      '422 Unprocessable Entity' => ActiveCampaign::UnprocessableEntityError
    }

    def initialize(error)
      error_class = ERRORS.find { |status, _| error.message.start_with?(status) }&.last
      if error_class
        raise error_class.new(error), "#{error.message}\nResponse body:\n#{error.response&.body}\n"
      else
        raise ActiveCampaign::APIError.new(error), "#{error.message}\nResponse body:\n#{error.response&.body}\n"
      end
    end
  end
end