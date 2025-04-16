retry_count = 0
# 例外処理
begin
  1 + '1'
  # エラーの情報を格納する
  # 例外オブジェクトのクラスが一致したものだけをキャッチする
rescue NameError => e
  p '例外が発生しました'
  p e.class
  p e.message

  # 下記の例は上にあるrescueでキャッチしてしまうエラーだから意味がない
  # 例外クラスの継承関係も大事
  # rescue NoMethodError => e
  #   p 'NameErrorが発生しました'

  # begin節をやり直したい時はretryを使う
  # 無限ループしないように、カウンタ変数を用意する
rescue StandardError => e
  retry_count += 1
  if retry_count < 3
    puts "リトライします。#{retry_count}回目"
    retry
  else
    puts '3回リトライしても失敗しました'
  end

  # ensureは例外が発生しても、必ず実行される
  # ensureを使う前に、ブロック付きのメソッドで自動で処理する方法はないか確認
ensure
  p 'この処理は必ず実行される'
end

# 意図的に例外を発生させる処理
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  else
    # 例外クラスとメッセージを指定できる
    raise ArgumentError, "Unknown country: #{country}"
  end
end

# currency_of(:uk) => dollar
# currency_of(:italy) => 例外が起きる

# 例外処理のtips
# 無闇にrescueせずに、即座に以上終了か、フレームワークの共通処理に頼るのがベター
# rescueしたら情報を残す, e.full_messageで詳細な情報を取得できる
# 例外処理の対象範囲と対象クラスを絞り込む
# 例外処理よりも、条件分岐を使う　-> ドキュメントなどでメソッドを確認、可読性とパフォーマンスでも優れてる
# 例外処理もテストを手を抜かない
# 例外処理にも戻り値がある、正常はbeginの戻り値、例外はrescueの戻り値

# rescue修飾子、メソッドの全体がbegin,endで囲まれてる場合などはbegin,endを省略できる
# rescue節でraiseすると、補足した例外を再び発生させる　-> コメントだけ残して以上終了させる時に便利
# 独自の例外クラスも定義可能

print 'Text?: '
text = gets.chomp

# 不適切な入力だと再入力させる
begin
  print 'Pattern?: '
  pattern = gets.chomp
  regex = Regexp.new(pattern)
rescue RegexpError => e
  puts "Invalid pattern: #{e.message}"
  retry
end

matches = text.scan(regex)
if matches.empty?
  puts 'No matches found.'
else
  p matches.join(', ')
end
