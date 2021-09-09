require 'active-campaign-simple/config'
require 'active-campaign-simple/request'

module ActiveCampaign

  class Client
    include Request

    # attr_accessor :retry_count
    attr_accessor *Config::VALID_OPTION_KEYS

    def initialize(options={})
      options = ActiveCampaign.options.merge(options)
      Config::VALID_OPTION_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

  end

end