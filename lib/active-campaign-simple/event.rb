module ActiveCampaign
  class Event

    class << self
      # Post event
      def post_event(key, actid, event, email, eventdata=nil)
        header = { content_type: 'application/x-www-form-urlencoded' }
        form = {
          key: key,
          actid: actid,
          event: event,
          visit: { email: email },
        }
        form.merge!({ eventdata: eventdata }) if eventdata
        opts = {
          url: "https://trackcmp.net/event",
          headers: header,
          form: form,
          method: 'post'
        }

        resp = RestClient::Request.execute(opts)
      rescue RestClient::ExceptionWithResponse => err
        raise APIError, err
      else
        return resp.body if resp.body # Some calls respond w nothing
      end
    end
  end
end
