# 正規表現の使用例
text = <<TEXT
  I love RUBY
  Python is great language
  Java and Javascript is also a good language
TEXT
# マッチした部分を配列として取得
p text.scan(/[A-Z][A-Za-z]+/)

# 正規表現を使用した置換の例
text = <<TEXT
  私の郵便番号は1234567です。
  僕の郵便番号は9876543です。
  兵庫県は1234567です。
TEXT
puts text.gsub(/(\d{3})(\d{4})/, '\1-\2')

# テキストの正規表現がマッチする部分を取得する例
p text[/(\d{3})(\d{4})/]

# 正規表現をマッチさせるいくつかの例
puts '123-456' =~ /(\d{3})-(\d{3})/ #=> マッチした位置を返す
p(/(\d+)-(\d+)/.match('123-456と124-567')) #=> MatchDataオブジェクトを返す

# マッチした値を取得
m = /(\d+)-(\d+)/.match('123-456と124-567')
p m[0]
p m[1]
p m[2]

# キャプチャに名前をつける
mm = /(?<first>\d+)-(?<second>\d+)/.match('123-456と124-567')
p mm[:first]
p mm[:second]

# ローカル変数にそのまま割り当てたりもできる
if /(?<first>\d+)-(?<second>\d+)/ =~ '123-456と124-567'
  puts "first: #{first}"
  puts "second: #{second}"
end

def convert_hash_syntax(old_hash)
  old_hash.gsub(/:(\w+) * => */, '\1: ')
end
