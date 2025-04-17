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

# ブロックを引数として受け取る
def greet2(&block)
  puts 'おはよう'

  puts block.call('こんにちは')

  puts 'こんばんは'
end

greet2 do |msg|
  puts msg * 2
end
