# 基本的なハッシュの書き方
a = { 'japan' => 'yen', 'us' => 'dollar', 'uk' => 'pound' }

# 変数の中にハッシュを代入
a['italy'] = 'euro'

# ハッシュの繰り返し, ブロックパラメータが一つなら配列が渡される
a.each do |key, value|
  puts "#{key}: #{value}"
end

# keyの削除
a.delete('uk')
