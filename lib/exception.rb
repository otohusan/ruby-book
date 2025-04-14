# 例外処理
begin
  1 + '1'
rescue StandardError
  p '例外が発生しました'
end
