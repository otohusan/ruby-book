class WordSynth
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(word)
    original_word = word

    effect.each do |effect|
      original_word = effect.call(original_word)
    end

    original_word
  end
end
