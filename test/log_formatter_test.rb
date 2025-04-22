require 'Minitest/autorun'
require_relative '../lib/log_formatter'

class LogFormatterTest < Minitest::Test
  def test_format_log
    text = LogFormatter.format_log
    lines = text.lines(chomp: true)

    assert_equal '[OK] request_id=1, path=/products/1', lines[0]
  end
end
