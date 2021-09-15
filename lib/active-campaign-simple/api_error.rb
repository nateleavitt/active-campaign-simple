module ActiveCampaign

  class APIError < StandardError
    def initialize(msg)
      ActiveCampaing.api_logger.error "ERROR: #{msg}"
      super(msg)
    end
  end

end

