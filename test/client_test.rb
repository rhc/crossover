
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

  end

  def test_read_1024_bytes_from_dev_urandom

  end

  def test_post

  end

end
