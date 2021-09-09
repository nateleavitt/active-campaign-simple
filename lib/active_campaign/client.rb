require 'active_campaign/config'
require 'active_campaign/request'

module ActiveCampaign

  class Connection
    include Request

    attr_accessor :retry_count
    attr_accessor *Config::VALID_OPTION_KEYS

    def initialize(options={})
      @retry_count = 0
      options = ActiveCampaign.options.merge(options)
      Config::VALID_OPTION_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

  end

end