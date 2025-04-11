# moduleの定義例
module Greetable
  def hello
    puts 'Hello from Greetable module!'
  end
end

class Person
  # modeuleをincludeすることで、モジュールのメソッドをクラスに追加できる
  include Greetable
end

person = Person.new
person.hello #=> Hello from Greetable module!
