require_relative '../helper.rb'

class TestIntegration < Minitest::Test
  def test_fail
    assert_equal true, false
  end
end
