# 配列で返る値を多重代入で受け取る例
quotient, remainder = 14.divmod(3)
puts "Quotient: #{quotient}, Remainder: #{remainder}"

# 配列の要素を削除する例, ブロックを使った例
a = [1, 2, 3, 4, 5, 6, 7, 8]
a.delete_if do |x|
  x > 5
end
print a
