require 'json'
require 'active_support/core_ext'
class ParseXmlService
  def initialize(url)
    @url = url
  end

  def call
    JSON.parse(Hash.from_xml(RestClient.get(@url)).to_json)
  end
end
