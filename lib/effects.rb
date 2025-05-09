# Effect
module Effects
  def self.reverse
    lambda do |word|
      word.split(' ').map(&:reverse).join(' ')
    end
  end

  def self.echo(rate = 1)
    lambda do |word|
      word.each_char.map { |char| char == ' ' ? ' ' : char * rate }.join
    end
  end

  def self.loud(rate = 1)
    lambda do |word|
      # メソッドチェーンは改行もできる
      word.upcase
          # ここにコメントもできる
          .split(' ')
          .map { |char| char + '!' * rate }
          .join(' ')
    end
  end
end
