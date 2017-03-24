require 'minitest/autorun'

class Test < MiniTest::Test

  value = 'XYZ'

  def test_downcase(value)
    assert_equals(value.downcase, 'xyz')
  end

end
