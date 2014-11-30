require "custom_string_methods"

module WebHelpers

  def get(url)
    Net::HTTP.get URI(url)
  end

  String.instance_eval do
    include CustomStringMethods
  end

end
