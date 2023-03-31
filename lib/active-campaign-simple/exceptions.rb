class ActiveCampaignAPIError < ::StandardError
  def initialize(error)
    stack = "ERROR: #{error}\n"
    stack += error.backtrace.join("\n") if error.backtrace
    ActiveCampaign.api_logger.error stack
    super(error)
  end
end

module ActiveCampaign
  class NotFoundError < ActiveCampaignAPIError; end
  class UnprocessableEntityError < ActiveCampaignAPIError; end
  class APIError < ActiveCampaignAPIError; end
end
