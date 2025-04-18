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
end
