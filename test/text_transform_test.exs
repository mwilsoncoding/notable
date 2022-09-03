defmodule TextTransformTest do
  use ExUnit.Case
  doctest TextTransform

  test "dictates lists" do
    input = "Patient presents today with several issues. Number one BMI has increased by 10% since their last visit. Number next patient reports experiencing dizziness several times in the last two weeks. Number next patient has a persistent cough that hasn’t improved for last 4 weeks."
    assert input |> TextTransform.dictated_list() == "Patient presents today with several issues.
1. BMI has increased by 10% since their last visit.
2. Patient reports experiencing dizziness several times in the last two weeks.
3. Patient has a persistent cough that hasn’t improved for last 4 weeks."
  end

  test "dictates lists starting with n" do
    input = "Patient presents today with several issues. Number three BMI has increased by 10% since their last visit. Number next patient reports experiencing dizziness several times in the last two weeks. Number next patient has a persistent cough that hasn’t improved for last 4 weeks."
    assert input |> TextTransform.dictated_list() == "Patient presents today with several issues.
3. BMI has increased by 10% since their last visit.
4. Patient reports experiencing dizziness several times in the last two weeks.
5. Patient has a persistent cough that hasn’t improved for last 4 weeks."
  end

  test "dictates lists beyond 9" do
    input = "Patient presents today with several issues. Number nine BMI has increased by 10% since their last visit. Number next patient reports experiencing dizziness several times in the last two weeks. Number next patient has a persistent cough that hasn’t improved for last 4 weeks."
    assert input |> TextTransform.dictated_list() == "Patient presents today with several issues.
9. BMI has increased by 10% since their last visit.
10. Patient reports experiencing dizziness several times in the last two weeks.
11. Patient has a persistent cough that hasn’t improved for last 4 weeks."
  end
end
