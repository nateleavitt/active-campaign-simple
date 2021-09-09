require 'active-campaign-simple/client'
require 'active-campaign-simple/config'
require 'active-campaign-simple/api_logger'

module ActiveCampaign
  extend Config
  class << self
    # Alias for ActiveCampaign::Client.new
    #
    # @return [ActiveCampaign::Client]
    def new(options={})
      ActiveCampaign::Client.new(options)
    end

    # Delegate to ActiveCampaign::Client
    def method_missing(method, *args, **kwargs)
      return super unless new.respond_to?(method)
      new.send(method, *args, **kwargs, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end