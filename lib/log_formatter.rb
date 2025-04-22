require 'net/http'
require 'json'
require 'uri'

# logを整形するモジュール
module LogFormatter
  def self.format_log
    uri = URI.parse('https://samples.jnito.com/access-log.json')
    json = Net::HTTP.get(uri)
    log = JSON.parse(json, symbolize_names: true)
    pp log
  end
end
