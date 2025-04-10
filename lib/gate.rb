# クラスの作成例
class User
  # 定数の定義
  # 定数はメソッド内では定義できず、トップでする必要ある
  # クラスメソッド内でも、インスタンスメソッド内でも使用できる
  DEFAULT_AGE = 20

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
    p "Hello, class method! I'm #{DEFAULT_AGE} years old."
  end

  # インスタンスメソッドの定義
  def ~
    puts 'Hello, instance method!'
  end
  # 以下のような書き方もある
  # class << self
  #   def ~
  # end

  # ||=はメモ化のためにも使われる
  def twitter_data
    @twitter_data ||= begin
      # TwitterAPIからデータを取得する処理
    end
  end

  # ダックタイピングの例
  # active?はサブクラスで定義されることを前提にしている
  # そのため、親クラスでは定義しない
  def display_status
    puts "Name: #{@name}, Age: #{@age}, Status: #{active?}"
  end
end

# インスタンスを作成してる例
user = User.new('Alice', 25)

# インスタンスメソッドの使用
user.hello

# クラスメソッドの使用
User.hello

# 親クラスで呼び出すとエラーになる（ダックタイピング）
# user.display_status =>  `display_status': undefined method `is_status?' for #<User:0x000000010d2365c8 @name="Alice", @age=25>

# 継承の例
class ActiveUser < User
  # クラス変数の定義
  # 同じクラスなら、全て統一した値になる
  @@count = 0

  # クラスインスタンス変数の定義
  # インスタンス変数との勘違いに注意
  @class_variable = 0

  def initialize(name, age, status)
    # 親クラスのinitializeメソッドを呼び出す
    super(name, age)
    @status = status
  end

  def hello
    # 親クラスのhelloメソッドを呼び出す
    # 親で定義された、同じ名前のメソッドをsuperは呼び出す
    # 親のメソッドと同じ名前のメソッドを定義し上書きすることを、オーバーライドという
    super
    puts "I'm #{@status}."
  end

  def self.hello
    p "Hello, I'm an active user!"
  end

  # ダックタイピングの例
  def active?
    true
  end

  # 外部に公開されないメソッドを定義
  # サブクラスでは呼び出せる、オーバーライドできることに注意
  private

  def private_method
    puts 'This is a private method.'
  end

  # クラスメソッドもprivateにできる
  private_class_method :hello
end

# 定義済みのクラスにメソッドを追加できる(オープンクラス)
# 既存の実装を、自分の求める実装に変更することはモンキーパッチ
class String
  def shuffle
    chars.shuffle.join
  end
end

p 'i am a string'.shuffle

# 特異メソッドの例
alice = 'Alice'
bob = 'Bob'

def alice.hello
  puts 'Hello, Alice!'
end

def bob.hello
  puts 'Hello, Bob!'
end

# 特異メソッドを定義したオブジェクトにだけ、特異メソッドが追加される
alice.hello #=> Hello, Alice!
bob.hello   #=> Hello, Bob!

# 特異メソッドの削除
class << alice
  remove_method :hello
end

# 特異メソッドの削除後、呼び出すとエラーになる
# alice.hello #=> NoMethodError: undefined method `hello' for "Alice":String

active_user = ActiveUser.new('Bob', 30, 'active')
# サブクラスだと、active?が定義されてるから呼び出せる
p active_user.display_status

# 例題
class Gate
  STATIONS = %i[umeda juso mikuni].freeze
  FARE = [160, 190].freeze

  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.stamp(@name)
  end

  def exit(ticket)
    ticket.price >= calc_fare(ticket)
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)

    FARE[to - from - 1]
  end
end
