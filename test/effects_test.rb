require 'Minitest/autorun'
require_relative '../lib/effects'

class EffectsTest < Minitest::Test
  def test_reverse
    assert_equal 'olleH dlrow', Effects.reverse.call('Hello world')
  end

  def test_echo
    assert_equal 'HHeelllloo wwoorrlldd', Effects.echo(2).call('Hello world')
    assert_equal 'HHHeeellllllooo wwwooorrrlllddd', Effects.echo(3).call('Hello world')
  end

  def test_loud
    assert_equal 'HELLO! WORLD!', Effects.loud(1).call('Hello world')
    assert_equal 'HELLO!! WORLD!!', Effects.loud(2).call('Hello world')
  end
end
