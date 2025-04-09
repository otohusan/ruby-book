# 正規表現の使用例
text = <<TEXT
  I love RUBY
  Python is great language
  Java and Javascript is also a good language
TEXT

puts text.scan(/[A-Z][A-Za-z]+/)

# 正規表現を使用した置換の例
text = <<TEXT
  私の郵便番号は1234567です。
  僕の郵便番号は9876543です。
  兵庫県は1234567です。
TEXT

puts text.gsub(/(\d{3})(\d{4})/, '\1-\2')
