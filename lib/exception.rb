# 例外処理
begin
  1 + '1'
  # エラーの情報を格納する
  # 例外オブジェクトのクラスが一致したものだけをキャッチする
rescue StandardError => e
  p '例外が発生しました'
  p e.class
  p e.message

  # 上にあるrescueでキャッチしてしまうエラーだから意味がない
  # 例外クラスの継承関係も大事
  # rescue NameError => e
  #   p 'NameErrorが発生しました'
end
