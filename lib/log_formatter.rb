require 'net/http'
require 'json'
require 'uri'

# logを整形するモジュール
module LogFormatter
  def self.format_log
    # 文字列をURI::HTTPオブジェクトに変換して、HTTPリクエストを作成
    uri = URI.parse('https://samples.jnito.com/access-log.json')
    json = Net::HTTP.get(uri)

    # symbolize_names: trueは keyをシンボルにしてる
    log = JSON.parse(json, symbolize_names: true)
    pp log
  end
end
