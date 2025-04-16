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

  # 上にあるrescueでキャッチしてしまうエラーだから意味がない
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
end
