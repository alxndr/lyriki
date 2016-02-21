require "custom_string_methods"

module WebHelpers

  def get(url, limit=10)
    raise ArgumentError, "get() redirects too deep" if limit < 1

    response = Net::HTTP.get_response(URI(url))
    case response
    when Net::HTTPSuccess     then response.body
    when Net::HTTPRedirection then get(response["location"], limit - 1)
    else response.error!
    end
  end

  String.instance_eval do
    include CustomStringMethods
  end

end
