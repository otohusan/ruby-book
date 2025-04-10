# クラスの作成例
class User
  # 外部からアクセス可能な属性を定義するためのアクセサメソッドを使用
  attr_accessor :name, :age

  # オブジェクト作成時に呼び出す
  def initialize(name, age)
    @name = name
    @age = age
  end

  # インスタンスメソッドの定義
  def hello
    puts "Hello, #{@name}!"
  end
end

class Gate
end
