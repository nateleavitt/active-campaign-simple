require 'rest-client'
require 'active-campaign-simple/api_error'
require 'active-campaign-simple/event'

module ActiveCampaign
  module Request
    # Perform an GET request
    def get(path)
      request(:get, path)
    end

    # Perform an HTTP POST request
    def post(path, payload: {})
      request(:post, path, payload)
    end

    # Perform an HTTP PUT request
    def put(path, payload: {})
      request(:put, path, payload)
    end

    # Perform an HTTP PATCH request
    def patch(path, payload: {})
      request(:patch, path, payload)
    end

    # Perform an HTTP DELETE request
    def delete(path)
      request(:delete, path)
    end

    # used for tracking events
    def track_event(key, actid, event, email, eventdata=nil)
      include Event
      post_event(key, actid, event, email, eventdata)
    end

    private

    # Perform request
    def request(method, path, payload={})
      path = "/#{path}" unless path.start_with?('/')
      header = {
        'Api-Token': api_key,
        content_type: :json,
        accept: :json,
      }
      opts = {
        method: method,
        url: api_url + '/api/3' + path,
        headers: header
      }
      opts.merge!( { payload: payload.to_json }) unless payload.empty?
      resp = RestClient::Request.execute(opts)
    rescue RestClient::ExceptionWithResponse => err
      raise APIError, err
    else
      return JSON.parse(resp.body) if resp.body # Some calls respond w nothing
    end

  end
end