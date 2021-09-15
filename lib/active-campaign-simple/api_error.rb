module ActiveCampaign

  class APIError < StandardError
    def initialize(msg)
      ActiveCampaign.api_logger.error "ERROR: #{msg}"
      super(msg)
    end
  end

end

