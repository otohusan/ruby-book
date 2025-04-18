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

  def test_play_with_many_effects
    @synth.add_effect(Effects.reverse)
    @synth.add_effect(Effects.echo(2))
    @synth.add_effect(Effects.loud(4))
    assert_equal 'OOLLLLEEHH!!!! DDLLRROOWW!!!!', @synth.play('Hello world')
  end
end
