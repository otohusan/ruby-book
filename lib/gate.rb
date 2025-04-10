# クラスの作成例
class User
  # 外部からアクセス可能な属性を定義するためのアクセサメソッドを使用
  # 読み取り、書き込みそれぞれの専用アクセサメソッドもある
  attr_accessor :name, :age

  # インスタンス作成時に呼び出す
  def initialize(name, age)
    # インスタンス変数を定義
    @name = name
    @age = age
  end

  # インスタンスメソッドの定義
  def hello
    puts "Hello, #{@name}!"
  end

  # クラスメソッドの定義
  def self.hello
    p 'Hello, class method!'
  end
  # 以下のような書き方もある
  # class << self
  #   def ~
  # end
end

class Gate
end
