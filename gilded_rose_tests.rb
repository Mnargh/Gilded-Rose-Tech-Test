require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase

  def test_foo
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].name, "fixme"
  end

end

# Can delete this as it is exaclyt the same test as Gilded_rose_spec.rb
