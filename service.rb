require 'json'

class Service < Sinatra::Base
  register Sinatra::Contrib
  register Sinatra::Session
  helpers  Sinatra::Param

  configure do
    set :SOMETHING,      ENV['SOMETHING']
    set :session_secret, :secret
  end

  helpers do
    def default_headers
      headers['Content-Type'] = 'application/json;charset=utf-8'
    end

    def error_response(message="Something went wrong!")
      default_headers
      halt 401, json( { errors: [ { message: message } ] } )
    end

    def valid_access_token
      authorization = request.env['HTTP_AUTHORIZATION']
      bearer_token = /Bearer (.*)\z/i.match(authorization).captures[0]

      # # TODO: verify access token is valid
      # unless user = lookup_user_with_access_token bearer_token
      #   error_response "Invalid access token!"
      # end
    end
  end

  get '/' do
    # param :something,   String, is: settings.SOMETHING
    # param :other_thing, String, required: true

    json :time => Time.now.iso8601
  end

end
