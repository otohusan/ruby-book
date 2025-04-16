# 例外処理
begin
  1 + '1'
  # エラーの情報を格納する
rescue StandardError => e
  p '例外が発生しました'
  p e.class
  p e.message
end
