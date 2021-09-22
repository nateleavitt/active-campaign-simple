class ActiveCampaignAPIError < StandardError
  def initialize(error)
    ActiveCampaign.api_logger.error "ERROR: #{error}"
    super(error)
  end
end

module ActiveCampaign
  class NotFoundError < ActiveCampaignAPIError; end
end
