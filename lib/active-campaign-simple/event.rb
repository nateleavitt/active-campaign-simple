require 'active-campaign-simple/exception_handler'

module ActiveCampaign
  class Event

    class << self
      # Post event
      def post_event(key, actid, event, email, eventdata=nil)
        headers = {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json'
        }

        visit_data = { "email" => email }.to_json

        form = {
          key: key,
          actid: actid,
          event: event,
          visit: visit_data
        }

        form[:eventdata] = eventdata if eventdata

        resp = RestClient.post("https://trackcmp.net/event", form, headers)
      rescue RestClient::ExceptionWithResponse => err
        ActiveCampaign::ExceptionHandler.new(err)
      else
        return resp.body if resp.body # Some calls respond w nothing
      end
    end
  end
end
