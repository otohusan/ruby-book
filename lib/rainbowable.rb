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
end

person = Person.new
person.hello #=> Hello from Greetable module!
# person.private_method => private_methodは呼び出せない
