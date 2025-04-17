def greet
  puts 'おはよう'

  # yieldはブロックを渡さないとエラーになるから、これで確認
  if block_given?
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

  # nil?でブロックが渡されているか確認
  puts block.call('こんにちは') unless block.nil?

  # ブロックパラメータの数を得られる
  puts block.arity

  puts 'こんばんは'
end

greet2 do |msg|
  puts msg * 2
end

# Procオブジェクトを作る
hello_proc = proc do
  puts 'hello'
end
# 以下みたいにも定義できる
# Proc.new {|msg| msg}

hello_proc.call
