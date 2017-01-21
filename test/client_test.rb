require 'test_helper'

class CrossoverClientTest < Minitest::Test
  def test_replace_all_spaces_with_asterisk
    {
      " " =>   "*",
      " Hello, world!" => "*Hello,*world!",
      "no-space-at-all" => "no-space-at-all",
      "\t" => "*"

    }.each do |before, after|
      assert_equal after, Crossover::Client.replace_all_spaces_with_asterisk(before)
    end
  end


  def test_clean_out_UTF8_non_complaint_chars
    {
      "I am so clean" => "I am so clean",

    }.each do |dirty, clean|
      assert_equal clean, Crossover::Client.clean_out_non_UTF8_compliant_chars(dirty)
    end

  end

  def test_read_1024_bytes_from_dev_urandom
    str = Crossover::Client.read_1024_bytes_from_dev_urandom
    assert_equal 1024, str.bytesize
  end

  def test_post

  end

end
