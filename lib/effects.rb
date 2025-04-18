# Effect
module Effects
  def self.reverse
    lambda do |word|
      word.split(' ').map(&:reverse).join(' ')
    end
  end
end
