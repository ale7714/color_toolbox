require 'minitest_helper'

class TestColorToolbox < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ColorToolbox::VERSION
  end
end
