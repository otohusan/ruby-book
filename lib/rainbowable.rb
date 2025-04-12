# moduleの定義例
module Greetable
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
