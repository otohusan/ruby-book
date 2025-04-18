require 'Minitest/autorun'
require_relative '../lib/effects'
require_relative '../lib/word_synth'

class WordSynthTest < Minitest::Test
  def setup
    @synth = WordSynth.new
  end

  def test_play
    assert_equal 'Hello world', @synth.play('Hello world')
  end

  def test_play_with_reverse
    @synth.add_effect(Effects.reverse)
    assert_equal 'olleH dlrow', @synth.play('Hello world')
  end
end
