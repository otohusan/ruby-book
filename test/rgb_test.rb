require 'minitest/autorun'
require_relative '../lib/rgb'

class RGBTest < Minitest::Test
  def test_to_hex
    assert_equal '#00000', to_hex(0, 0, 0)
    assert_equal '#fffff', to_hex(255, 255, 255)
  end
end
