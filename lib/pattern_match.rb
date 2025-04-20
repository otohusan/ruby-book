require 'date'

# パターンマッチの特徴
# 1. 配列やハッシュの構造をもとに場合分けできる
# 2. = を使わずに変数に代入できる
# 3. 各要素のマッチ判定には====が使われる

# 基本のパターンマッチ例(value)
country = 'Japan'
case country
in 'Japan'
  puts '日本'
in 'US'
  puts 'アメリカ'
in 'UK'
  puts 'イギリス'

  # else -> 例外を防ぎたい場合は追加する
end

# 基本のパターンマッチ例(variable)
alice = 'Alice'
case 'Alice'
# 変数に代入する
in obj
  p "#{obj}"

# ^は変数の値を参照する
in ^alice
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

case ['Alice', 999, 3]
  # クラス名や、範囲オブジェクトも指定できる、_は任意の要素,*は任意の長さの要素
in [String, 10..., _]
  p n
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

  # **nilは他のキーと値がないことを指定
  in { name: name, **nil }
    p name

  # ** は任意のキーと値を指定
  in { name: name, **_ }
    p name
  else
    puts '不明な形式'
  end
end
