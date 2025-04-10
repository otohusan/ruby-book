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
end

# インスタンスを作成してる例
user = User.new('Alice', 25)

# インスタンスメソッドの使用
user.hello

# クラスメソッドの使用
User.hello

class ActiveUser < User
  # クラス変数の定義
  # 同じクラスなら、全て統一した値になる
  @@count = 0

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

  # 外部に公開されないメソッドを定義
  # サブクラスでは呼び出せる、オーバーライドできることに注意
  private

  def private_method
    puts 'This is a private method.'
  end

  # クラスメソッドもprivateにできる
  private_class_method :private_method
end

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
