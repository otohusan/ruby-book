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

# 基本のパターンマッチ例(as)
case { name: 'Alice', age: 20 }
# マッチしたハッシュを変数に代入
# 二つ以上のパターンは | で区切る
in {name: String | Integer, age: 18...} => person
  p person
end

# 基本のパターンマッチ例(find)
# *を２個使って、前と後ろにある任意の要素を指定
case [2, 3, 4, 6, 12, 2, 15, 16, 17, 0, 9]
in [*, 10.. => a, 10.. => b, 10.. => c, * ]
  p a
  p b
  p c
end

# ガード式の例
data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
case data
# in節のパターンにマッチするに加えて、条件式も追加（ガード式）
# in節で定義した変数へのアクセスも可能
in [a, b, c] if b == a + 1 && c == a + 2
  p a
  p b
  p c
else
  puts '不明な形式'
end
