require 'date'

# パターンマッチの特徴
# 1. 配列やハッシュの構造をもとに場合分けできる
# 2. = を使わずに変数に代入できる

# 基本のパターンマッチ例(value)
country = 'Japan'
case country
in 'Japan'
  puts '日本'
in 'US'
  puts 'アメリカ'
in 'UK'
  puts 'イギリス'
end

# 基本のパターンマッチ例(array)
records = [[2001], [2002, 5], [2004, 6, 14]]
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

# 基本のパターンマッチ例(hash)
cars = [{ name: 'Prius', engine: '98ps' },
        { name: 'Leaf', engine: '0ps', motor: '150ps' },
        { name: 'Model3', motor: '250ps' }]

cars.each do |car|
  case car
  in { name: name, engine: engine }
    puts "#{name}のエンジンは#{engine}"
  in { name: name, motor: motor }
    puts "#{name}のモーターは#{motor}"
  else
    puts '不明な形式'
  end
end
