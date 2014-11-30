module WebHelpers

  def url_encode(str)
    CGI.escape str
  end

  def get(url)
    Net::HTTP.get URI(url)
  end

end
