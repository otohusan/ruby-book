require 'Minitest/autorun'
require_relative '../lib/log_formatter'

class LogFormatterTest < Minitest::Test
  def test_format_log
    assert LogFormatter.format('Hello')
  end
end
