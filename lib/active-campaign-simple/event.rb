require 'active-campaign-simple/exception_handler'

module ActiveCampaign
  class Event

    class << self
      # Post event
      def post_event(key, actid, event, email, eventdata=nil)
        # header = { content_type: 'application/x-www-form-urlencoded' }
        form = {
          key: key,
          actid: actid,
          event: event,
          visit: URI.encode_www_form_component("{\"email\":\"#{email}\"}")
        }
        form.merge!({ eventdata: eventdata }) if eventdata

        resp = RestClient.post("https://trackcmp.net/event", form)
      rescue RestClient::ExceptionWithResponse => err
        ActiveCampaign::ExceptionHandler.new(err)
      else
        return resp.body if resp.body # Some calls respond w nothing
      end
    end
  end
end
