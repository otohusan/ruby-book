module Effects
  def self.reverse
    lambda do |word|
      word.split(' ').reverse.join
    end
  end
end
