# active-campaign-simple
Simple Ruby REST wrapper for the Active Campaign API


## <a name="info">Info</a>
This is a very simple wrapper around the REST ActiveCampaign API. You will still need to provide the path and the payload for each request. Eventually I will grow this out to be more convenient, if needed. Right now, this just provides some conveniences and an easy way to configure the API and not much more... hence the name active-campaign-simple :)

Use the public API as a guide for paths (urls) and payload info: https://developers.activecampaign.com/

## <a name="installation">Installation</a>
`gem install active-campaign-simple`

## <a name="setup">Config</a>
1. add `gem 'active-campaign-simple'` to your `Gemfile`
2. Get your API URL and Key from within your application (Settings > Developer)
3. Then create an initializer in `config\initializers` called active_campaign.rb and the following

```ruby
# Added to your config\initializers file
ActiveCampaign.configure do |config|
  config.api_url = 'YOUR_API_URL'
  config.api_key = 'YOUR_API_KEY'
  config.api_logger = Logger.new("#{Rails.root}/log/active_campaign_api.log") # optional logger file
end
```

## <a name="examples">Examples</a>

```ruby
# Get a list of contacts
ActiveCampaign.get('/contacts')

# Get a contact
ActiveCampaign.get('/contacts/' + id)

# Create (post) a new contact
# https://developers.activecampaign.com/reference#create-a-contact-new
ActiveCampaign.post('/contacts', payload: {
  contact: {
    email: 'nate@test.com',
    firstName: 'Nate',
    lastName: 'Test',
    phone: '1231231234'
  },
  fieldValues: [
    {
      field: '1',
      value: 'The Value for First Field'
    }
  ]
})

# Update (put) a contact
ActiveCampaign.put('/contacts/' + id, payload: {
  contact: {
    email: 'nate@test.com'
  }
})

# Delete a contact
ActiveCampaign.delete('/contacts/' + id)

# Search for a contact
ActiveCampaign.get('/contacts', query: { email: 'test@test.com' })

# Event Tracking
# See: https://developers.activecampaign.com/reference#track-event
# NOTE - The tracking API is different from all other calls as it changes the arguments a little to simplify.
ActiveCampaign.track_event('event-key', 'actid', 'event-name', 'email')

# or with optional eventdata
ActiveCampaign.track_event('event-key', 'actid', 'event-name', 'email', 'eventdata')
```

## <a name="contributing">Contributing</a>
In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

See [MIT LICENSE](https://github.com/nateleavitt/active-campaign-simple/blob/master/LICENSE.md) for details.