class WordSynth
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(word)
    original_word = word

    @effects.each do |effect|
      original_word = effect.call(original_word)
    end

    original_word

    # リファクタリング例
    # @effects.reduce(word) do |current_word, effect|
    #   effect.call(current_word)
    # end
  end
end
