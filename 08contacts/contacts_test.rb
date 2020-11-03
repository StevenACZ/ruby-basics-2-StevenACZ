$LOAD_PATH.unshift("./08contacts")

require_relative "../lib/io_test_helpers"
require "minitest/autorun"

class GradesTest < Minitest::Test
  include IoTestHelpers

  def test_display
    output, _error = capture_io do
      simulate_stdin("display", "exit") { load "contacts.rb" }
    end

    assert_includes output.lines.map(&:chomp), "All your contacts:"
    assert_includes output.lines.map(&:chomp), "- Deyvi"
    assert_includes output.lines.map(&:chomp), "- Diego"
    assert_includes output.lines.map(&:chomp), "- Wences"
  end

  def test_show
    output, _error = capture_io do
      simulate_stdin("show", "Diego", "exit") { load "contacts.rb" }
    end

    assert_includes output.lines.map(&:chomp), "- country: Peru"
    assert_includes output.lines.map(&:chomp), "- email: diego@able.co"
    assert_includes output.lines.map(&:chomp), "- phone: +51 987654321"
  end

  def test_show_user_that_not_exists
    output, _error = capture_io do
      simulate_stdin("show", "XXX", "exit") { load "contacts.rb" }
    end

    assert_includes output.lines.map(&:chomp), "Contact doesn't exist"
  end

  def test_add
    data = ["Mexico", "jordi@able.co", "+51 1234567891"]

    output, _error = capture_io do
      simulate_stdin("add", "Jordi", *data, "show", "Jordi", "exit") { load "contacts.rb" }
    end

    assert_includes output.lines.map(&:chomp), "- country: Mexico"
    assert_includes output.lines.map(&:chomp), "- email: jordi@able.co"
    assert_includes output.lines.map(&:chomp), "- phone: +51 1234567891"
  end

  def test_add_user_already_exists
    output, _error = capture_io do
      simulate_stdin("add", "Diego", "exit") { load "contacts.rb" }
    end

    assert_includes output.lines.map(&:chomp), "Contact already exists"
  end

  def test_update
    data = ["Lima", "diego2@able.co", "000"]

    output, _error = capture_io do
      simulate_stdin("update", "Diego", *data, "show", "Diego", "exit") { load "contacts.rb" }
    end

    assert_includes output.lines.map(&:chomp), "- country: Lima"
    assert_includes output.lines.map(&:chomp), "- email: diego2@able.co"
    assert_includes output.lines.map(&:chomp), "- phone: 000"
  end

  def test_update_user_that_not_exists
    output, _error = capture_io do
      simulate_stdin("update", "XXX", "exit") { load "contacts.rb" }
    end

    assert_includes output.lines.map(&:chomp), "Contact doesn't exist"
  end

  def test_delete
    output, _error = capture_io do
      simulate_stdin("delete", "Diego", "show", "Diego", "exit") { load "contacts.rb" }
    end

    assert_includes output.lines.map(&:chomp), "Diego has been deleted"
    assert_includes output.lines.map(&:chomp), "Contact doesn't exist"
  end

  def test_delete_user_that_not_exists
    output, _error = capture_io do
      simulate_stdin("delete", "XXX", "exit") { load "contacts.rb" }
    end

    assert_includes output.lines.map(&:chomp), "Contact doesn't exist"
  end

  def test_invalid_action
    output, _error = capture_io do
      simulate_stdin("invalid", "exit") { load "contacts.rb" }
    end

    assert_match "Invalid action", output
  end
end
