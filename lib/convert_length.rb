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

# シンボルの定義
# 同じ名前のシンボルは常に同じオブジェクト, シンボルは不変であるため、文字列のように変更（破壊的操作）はできない, 中身は整数だから軽量で高速
puts :apple.class
puts 'apple'.class

# シンボルをハッシュのキーに使う
b = { japan: 'yen', us: 'dollar', uk: 'pound' }
puts b

# キーワード引数の例
def buy_burger(menu, drink: false, potato: false)
  puts "メニュー: #{menu}"
  puts "ドリンク: #{drink}"
  puts "ポテト: #{potato}"
end
# 使用例、デフォルト値があるから、引数を省略もできる
buy_burger('ハンバーガー', drink: true, potato: true)

# キーワード引数としてハッシュを変換して渡す
# これは任意のキーワードを渡す時にも使われる
parms = { drink: true, potato: true }
buy_burger('チーズバーガー', **parms)

# ハッシュにデフォルト値を与える
# 参照を理解して使い分け
# h = Hash.new('default')
# h2 = Hash.new { 'default' }

# シンボルの配列を%記法で作成
print %i[apple orange banana]

UNITS = { m: 1.0, ft: 3.28, in: 39.37 }.freeze
def convert_length(length, from:, to:)
  (length / UNITS[from] * UNITS[to]).round(2)
end
