require 'date'

# パターンマッチの特徴
# 1. 配列やハッシュの構造をもとに場合分けできる
# 2. = を使わずに変数に代入できる

records = [[2001], [2002, 5], [2004, 6, 14]]

# 基本のパターンマッチ例
records.each do |record|
  case record
  in [year]
    puts "#{year}年"
  in [year, month]
    puts "#{year}年#{month}月"
  in [year, month, day]
    puts "#{year}年#{month}月#{day}日"
  else
    puts '不明な形式'
  end
end
