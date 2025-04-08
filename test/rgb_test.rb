require 'minitest/autorun'
require_relative '../lib/rgb'

class RGBTest < Minitest::Test
  def test_to_hex
    assert_equal '#00000', to_hex(0, 0, 0)
  end
end
