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
