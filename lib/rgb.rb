# 配列で返る値を多重代入で受け取る例
quotient, remainder = 14.divmod(3)
puts "Quotient: #{quotient}, Remainder: #{remainder}"

# 配列の要素を削除する例, ブロックを使った例
a = [1, 2, 3, 4, 5, 6, 7, 8]
a.delete_if do |x|
  x > 5
end
puts a

# 配列を文字列にする方法の使い分け（join, sum）
chars = %w[a b c]
# 文字列に変換
puts chars.join
# 文字列に変換（区切り文字を指定）
puts chars.join('-')
# 文字列に変換(先頭に文字追加や文字を加工する場合)
puts chars.sum('<') { |x| x.upcase }

# 範囲が最後の値を含む場合と、含まない場合
puts((1..5).sum { |x| x })
puts((1...5).sum { |x| x })

# *を使うと、残りの要素を配列として受け取れる
e, *f = [1, 2, 3, 4, 5]
puts "e: #{e}, f: #{f}"

# Array.new()に初期値とブロックを与える例
array = Array.new(10) { |i| i % 3 }
puts array

def to_hex(r, g, b)
  [r, g, b].sum('#') do |color|
    color.to_s(16).rjust(2, '0')
  end
end

def to_ints(hex)
  # シンプルに変数を定義して受け取る場合
  # r = hex[1..2].hex
  # g = hex[3..4].hex
  # b = hex[5..6].hex

  # 正規表現とmapを使った場合
  hex.scan(/\w\w/).map(&:hex)
end
