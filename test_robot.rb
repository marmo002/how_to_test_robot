require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def setup
    @robot = Robot.new
  end

  def teardown
    @robot = nil
  end

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    @robot.needs_repairs = true
    @robot.foreign_model = true

    # act
    actual_value = @robot.station
    expected_value = 1

    # assert
    assert_equal(expected_value, actual_value)

  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    @robot.needs_repairs = true
    @robot.vintage_model = true

    # act
    actual_value = @robot.station

    # assert
    expected_value = 2
    assert_equal(expected_value, actual_value)

  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    @robot.needs_repairs = true

    # act
    actual_value = @robot.station

    # assert
    expected_value = 3
    assert_equal(actual_value, expected_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange

    # act
    actual_value = @robot.station

    # assert
    expected_value = 4
    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange

    # act
    actual_value = @robot.prioritize_tasks

    # assert
    expected_value = -1
    assert_equal(actual_value, expected_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    @robot.todos = %w(f as g h t)

    # act
    actual_value  = @robot.prioritize_tasks

    # assert
    expected_value = "t"
    assert_equal(expected_value, actual_value)
  end

  def test_workday_on_day_off_returns_false

    # arrange
    @robot.day_off = "wednesday"

    # act
    actual_value = @robot.workday?("wednesday")

    # assert
    expected_value = false
    assert_equal(expected_value, actual_value)
  end

  def test_workday_not_day_off_returns_true

    # arrange
    @robot.day_off = "Monday"

    # act
    actual_value = @robot.workday?("Tuesday")

    # assert
    expected_value = true
    assert_equal(expected_value, actual_value)
  end

end
