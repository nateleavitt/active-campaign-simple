class ActiveCampaignAPIError < StandardError
  def initialize(error)
    ActiveCampaign.api_logger.error "ERROR: #{msg}"
    super(msg)
  end
end

module ActiveCampaign
  class NotFoundError < ActiveCampaignAPIError; end
end
