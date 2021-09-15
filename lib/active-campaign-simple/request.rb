require 'rest-client'

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
      # log error?
      api_logger.error(err)
    else
      return JSON.parse(resp.body) if resp.body # Some calls respond w nothing
    end
  end
end