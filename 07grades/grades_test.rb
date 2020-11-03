$LOAD_PATH.unshift("./07grades")

require_relative "../lib/io_test_helpers"
require "minitest/autorun"

class GradesTest < Minitest::Test
  include IoTestHelpers

  def test_display_student_names_correctly
    count = "3"
    student1 = "Diego, 0, 0"
    student2 = "Wences, 0, 0"
    student3 = "Deyvi, 0, 0"
    output, _error = capture_io do
      simulate_stdin(count, student1, student2, student3) { load "grades.rb" }
    end

    assert_match "Diego", output, "When 'Diego' is registered as a student, his name does not appear in the results"
    assert_match "Wences", output, "When 'Wences' is registered as a student, his name does not appear in the results"
    assert_match "Deyvi", output, "When 'Deyvi' is registered as a student, his name does not appear in the results"
  end

  def test_display_correct_scores
    count = "3"
    student1 = "Diego, 50, 10"
    student2 = "Wences, 60, 15"
    student3 = "Deyvi, 65, 12"
    output, _error = capture_io do
      simulate_stdin(count, student1, student2, student3) { load "grades.rb" }
    end

    assert_match "626", output, "The score '626' is not displayed for the combination: 65 correct and 12 incorrect"
    assert_match "570", output, "The score '570' is not displayed for the combination: 60 correct and 15 incorrect"
    assert_match "480", output, "The score '480' is not displayed for the combination: 50 correct and 10 incorrect"
  end

  def test_display_score_bars_correctly
    count = "3"
    student1 = "Diego, 50, 10"
    student2 = "Wences, 60, 15"
    student3 = "Deyvi, 65, 12"
    output, _error = capture_io do
      simulate_stdin(count, student1, student2, student3) { load "grades.rb" }
    end

    assert_match  "###############################:::::::::::::::::::",
                  output,
                  "The bar for a score of '626' is not displayed correctly (combination: 65 correct and 12 incorrect)"
    assert_match  "############################::::::::::::::::::::::",
                  output,
                  "The bar for a score of '570' is not displayed correctly (combination: 60 correct and 15 incorrect)"
    assert_match  "########################::::::::::::::::::::::::::",
                  output,
                  "The bar for a score of '480' is not displayed correctly (combination: 50 correct and 10 incorrect)"
  end

  def test_display_scores_in_descending_order
    count = "3"
    student1 = "Diego, 50, 10"
    student2 = "Wences, 60, 15"
    student3 = "Deyvi, 65, 12"
    output, _error = capture_io do
      simulate_stdin(count, student1, student2, student3) { load "grades.rb" }
    end

    assert_equal  "Deyvi scored 626 points",
                  output.lines[-6].chomp,
                  "Deyvi should appear first when inputs are: Diego, 50, 10; Wences, 60, 15; Deyvi, 65, 12"
    assert_equal  "Wences scored 570 points",
                  output.lines[-4].chomp,
                  "Wences should appear second when inputs are: Diego, 50, 10; Wences, 60, 15; Deyvi, 65, 12"
    assert_equal  "Diego scored 480 points",
                  output.lines[-2].chomp,
                  "Diego should appear third when inputs are: Diego, 50, 10; Wences, 60, 15; Deyvi, 65, 12"
  end

  def test_display_score_0_when_negative_points
    count = "1"
    student1 = "Diego, 10, 60"
    output, _error = capture_io do
      simulate_stdin(count, student1) { load "grades.rb" }
    end

    assert_equal "Diego scored 0 points", output.lines[-2].chomp
  end
end
