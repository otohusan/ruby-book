def greet
  puts 'おはよう'
  # ブロックを渡すと、ここで発動する
  yield
  puts 'こんばんは'
end

greet do
  puts 'こんにちは'
end
