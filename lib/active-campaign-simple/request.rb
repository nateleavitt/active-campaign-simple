require 'rest-client'

module ActiveCampaign
  module Request
    # Perform an GET request
    def get(path, query: {})
      request(:get, path, token, query )
    end

    # Perform an HTTP POST request
    def post(path, query: {}, payload: {})
      request(:post, path, query, payload)
    end

    # Perform an HTTP PUT request
    def put(path, query: {}, payload: {})
      request(:put, path, query, payload)
    end

    # Perform an HTTP PATCH request
    def patch(path, query: {}, payload: {})
      request(:patch, path, query, payload)
    end

    # Perform an HTTP DELETE request
    def delete(path, query: {})
      request(:delete, path, query)
    end

    private

    # Perform request
    def request(method, path, query={}, payload={})
      path = "/#{path}" unless path.start_with?('/')
      header = {
        'Api-Token': api_key,
        content_type: :json,
        accept: :json,
        params: query
      }
      opts = {
        method: method,
        url: api_url + path,
        headers: header
      }
      opts.merge!( { payload: payload.to_json }) unless payload.empty?
      resp = RestClient::Request.execute(opts)
    rescue RestClient::ExceptionWithResponse => err
      # log error?
    else
      return JSON.parse(resp.body) if resp.body # Some calls respond w nothing
    end
  end
end