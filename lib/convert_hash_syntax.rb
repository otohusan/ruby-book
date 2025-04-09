text = <<TEXT
  I love RUBY
  Python is great language
  Java and Javascript is also a good language
TEXT

puts text.scan(/[A-Z][A-Za-z]+/)
