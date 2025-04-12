# moduleの定義例
module Greetable
  # moduleでもmoduleをincludeできる
  include Loggable

  def hello
    puts 'Hello from Greetable module!'
  end

  # privateメソッドを定義する
  # includeされたクラスでもprivateだと扱われる
  private

  def private_method
    puts 'This is a private method from Greetable module.'
  end
end

class Person
  # moduleをincludeすることで、モジュールのメソッドをクラスに追加できる
  # (ミックスイン)
  include Greetable
  # クラスメソッドとして定義する
  extend Greetable # クラスメソッドを追加する
end

# moduleにもクラスメソッドにも定義できる
# classと違い、newをする必要がない、単なるメソッドの集合を作りたい場合
module Loggable
  def self.log
    puts 'Logging...'
  end

  def hello
    puts 'Hello from Loggable module!'
  end

  # ミックスインとしても、特異メソッドとしても使えるようにする
  module_function :log

  # refineは、特定のスコープでのみ有効なメソッドを定義するためのもの
  # 特定のスコープでのみ、オープンクラスやモンキーパッチを適応する
  refine String do
    def shuffle
      chars.shuffle.join
    end
  end
end

class User
  using Loggable

  def initialize(name)
    @name = name
  end

  def shuffle
    # refineされたメソッドを使う
    @name.shuffle
  end
end

person = Person.new
person.hello #=> Hello from Greetable module!
# person.private_method => private_methodは呼び出せない

# クラスメソッドとして呼び出す
Person.hello #=> Hello from Greetable module!

module Rainbowable
  def rainbow
    to_s.each_char.map.with_index do |char, index|
      color_code = 31 + index % 6
      "\e[#{color_code}m#{char}"
    end.join + "\e[0m"
  end
end
