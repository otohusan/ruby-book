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

person = Person.new
person.hello #=> Hello from Greetable module!
# person.private_method => private_methodは呼び出せない

# クラスメソッドとして呼び出す
Person.hello #=> Hello from Greetable module!

module Rainbowable
  def rainbow
    str = to_s

    count = 0
    colored_char = []

    str.each_char do |char|
      color_code = 31 + count % 6
      colored_char << "\e[#{color_code}m#{char}"
      count += 1
    end

    "#{colored_char.join}\e[0m"
  end
end
