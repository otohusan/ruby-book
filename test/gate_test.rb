require 'Minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GateTest < Minitest::Test
  def setup
    @umeda = Gate.new(:umeda)
    @juso  = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  def test_gate
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    assert @juso.exit(ticket)
  end

  def test_umeda_to_mikuni_fare_is_not_enough
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    assert !@mikuni.exit(ticket)
  end
end
