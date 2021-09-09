require 'active-campaign-simple/version'

module ActiveCampaign

  module Config
    # The list of available options
    VALID_OPTION_KEYS = [
      :api_url,
      :api_key,
      :logger,
      :user_agent # allows you to change the User-Agent of the request headers
    ].freeze

    # @private
    attr_accessor *VALID_OPTION_KEYS

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTION_KEYS.each{|k| options[k] = send(k)}
      options
    end

    def user_agent
      @user_agent ||= "active-campaign-simple-#{VERSION} (RubyGem)"
    end

    def logger
      logger || ActiveCampaign::Logger.new
    end
  end

end