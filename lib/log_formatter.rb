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
    log_data = JSON.parse(json, symbolize_names: true)

    log_data.map do |log|
      case log
        # alternativeパターン、asパターンを使ってる
      in { request_id:, path:, error:, status: 404 | 500 => status}
        "[ERROR] request_id=#{request_id}, path=#{path}, status=#{status}, error=#{error}"

      in {request_id:, path:, duration: 1000... => duration, }
        "[WARN] request_id=#{request_id}, path=#{path}, duration=#{duration}"

      in { request_id:, path:, }
        "[OK] request_id=#{request_id}, path=#{path}"

      end
    end.join("\n")
  end
end
