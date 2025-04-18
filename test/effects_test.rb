require 'Minitest/autorun'
require_relative '../lib/effects'

class EffectsTest < Minitest::Test
  def test_reverse
    assert_equal 'olleH dlrow', Effects.reverse.call('Hello world')
  end
end
