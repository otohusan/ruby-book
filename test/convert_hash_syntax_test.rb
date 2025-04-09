require 'MiniTest/autorun'
require_relative '../lib/convert_hash_syntax'

class ConvertHashSyntaxTest < Minitest::Test
  def test_convert_hash_syntax
    old_syntax = <<~TEXT
      { :name => 'Alice', :age => 30, :city => 'Tokyo' }
    TEXT
    expected = <<~TEXT
      { name: 'Alice', age: 30, city: 'Tokyo' }
    TEXT

    assert_equal '{}', convert_hash_syntax('{}')
    assert_equal expected, convert_hash_syntax(old_syntax)
  end
end
