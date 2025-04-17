def greet
  puts 'おはよう'

  # yieldはブロックを渡さないとエラーになるから、これで確認
  if bock_given?
    # ブロックを渡すと、ここで発動する
    yield
    # yieldは複数回使える
    yield
  end

  puts 'こんばんは'
end

greet do
  puts 'こんにちは'
end
