require "test_helper"
require "fileutils"

class RetinatorTest < Minitest::Test
  TEST_IMAGE = "test/vertical.jpg"

  def setup
    $stdout = StringIO.new # Avoid console output while testing
  end

  def teardown
    ["vertical.png", "vertical@2x.png", "vertical@3x.png"].each do |file|
      FileUtils.rm file if File.exist? file
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::Retinator::VERSION
  end

  def test_passing_no_arguments_then_error
    result = Retinator.generate(nil, nil)

    assert_equal false, result
  end

  def test_passing_one_argument_then_error
    result = Retinator.generate(nil, 100)

    assert_equal false, result
  end

  def test_passing_not_found_file_then_error
    result = Retinator.generate("notfound", 100)

    assert_equal false, result
  end

  def test_passing_wrong_resolutions_then_error
    resultZero = Retinator.generate(TEST_IMAGE, 0)
    resultNegative = Retinator.generate(TEST_IMAGE, -100)
    resultLetters = Retinator.generate(TEST_IMAGE, "wwww")

    assert_equal false, resultZero
    assert_equal false, resultNegative
    assert_equal false, resultLetters
  end

  def test_passing_correct_arguments_images_generated
    result = Retinator.generate(TEST_IMAGE, 100)

    assert_equal true, result
  end
end
